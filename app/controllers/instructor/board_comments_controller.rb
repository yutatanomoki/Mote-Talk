class Instructor::BoardCommentsController < ApplicationController
  def create
    @request_board = RequestBoard.find(params[:request_board_id])
    @board_comment = BoardComment.new(board_comment_params)
    @board_comment.request_board_id = @request_board.id
    @board_comment.instructor_id = current_user.id
    unless @board_comment.save
      render 'error'  # app/views/book_comments/error.js.erbを参照する ※要件外
    end
    # app/views/board_comments/create.js.erbを参照する
  end

  def destroy
    @request_board = RequestBoard.find(params[:request_board_id])
    board_comment = @request_board.board_comments.find(params[:id])
    board_comment.destroy
    # app/views/board_comments/destroy.js.erbを参照する
  end

  private
  def board_comment_params
    params.require(:board_comment).permit(:comment)
  end
end

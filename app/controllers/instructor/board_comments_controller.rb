class Instructor::BoardCommentsController < ApplicationController
  def create
    @request_board = RequestBoard.find(params[:request_board_id])
    @board_comment = BoardComment.new(board_comment_params)
    @board_comment.request_board_id = @request_board.id
    @board_comment.instructor_id = current_user.id
    unless @board_comment.save
      render 'error'  # app/views/book_comments/error.js.erbを参照する ※要件外
    end
    
    # コメントのリストを取得
    # request_boards_controller#show とやっていることは一緒
    @board_comments = BoardComment.joins("INNER JOIN instructors ON instructors.id = board_comments.instructor_id INNER JOIN users ON instructors.user_id = users.id ")
                     .where(request_board_id: params[:request_board_id]).select("board_comments.*, users.*")
    # app/views/board_comments/create.js.erbを参照する
    render '/board_comments/create'
  end

  def destroy
    @request_board = RequestBoard.find(params[:request_board_id])
    board_comment = @request_board.board_comments.find(params[:id])
    board_comment.destroy
    # app/views/board_comments/destroy.js.erbを参照する
    render '/board_comments/destroy'
  end

  private
  def board_comment_params
    params.require(:board_comment).permit(:comment)
  end
end

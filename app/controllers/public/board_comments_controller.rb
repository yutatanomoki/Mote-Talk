class Public::BoardCommentsController < ApplicationController
  def create
    @request_board = RequestBoard.find(params[:request_board_id])
    @board_comment = current_user.request_boards.new(request_board_params)
    @board_comment.request_board_id = @request_board.id
    @board_comment.save
  end
  
  def destroy
    BoardComment.find_by(id: params[:id], request_board_id: params[:request_board_id]).destroy
    redirect_to request_board_path(params[:request_board_id])
  end
  
  private

  def book_comment_params
    params.require(:board_comment).permit(:comment)
    # {"book_comment"=>{"comment"=>"hogehoge"}}
  end
end

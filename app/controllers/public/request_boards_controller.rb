class Public::RequestBoardsController < ApplicationController
  def new
    @request_board = RequestBoard.new
  end

  def index
    @request_boards = RequestBoard.all
  end

  def show
    @request_board = RequestBoard.find(params[:id])
    @board_comment = BoardComment.new
  end

  def create
    @request_board = RequestBoard.new(request_board_params)
    @request_board.user_id = current_user.id
    if @request_board.save
      redirect_to request_boards_path, notice: "You have created book successfully."
    else
      @request_board = RequestBoard.all
      render 'index'
    end
  end

  private

  def request_board_params
    params.require(:request_board).permit(:title,:body)
  end

end

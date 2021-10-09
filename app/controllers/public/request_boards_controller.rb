class Public::RequestBoardsController < ApplicationController
  def new
    @request_board = RequestBoard.new
  end

  def index
    @request_boards = RequestBoard.page(params[:page]).reverse_order
    @board_comment = BoardComment.joins("INNER JOIN instructors ON instructors.id = board_comments.instructor_id INNER JOIN users ON instructors.user_id = users.id ").
      where(request_board_id: params[:id]).select("board_comments.*, users.*")
  end

  def show
    @request_board = RequestBoard.find(params[:id])
    @board_comment = BoardComment.joins("INNER JOIN instructors ON instructors.id = board_comments.instructor_id INNER JOIN users ON instructors.user_id = users.id ").
      where(request_board_id: params[:id]).select("board_comments.*, users.*")
  end

  def create
    @request_board = RequestBoard.new(request_board_params)
    @request_board.score = Language.get_data(request_board_params[:body])
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
    params.require(:request_board).permit(:title, :body, :score)
  end
end

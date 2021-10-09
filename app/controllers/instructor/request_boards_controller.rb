class Instructor::RequestBoardsController < ApplicationController
  def index
    @request_boards = RequestBoard.all
  end

  def show
    @request_board = RequestBoard.find(params[:id])
    @board_comment = BoardComment.new
  end
end

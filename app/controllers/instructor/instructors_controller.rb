class Instructor::InstructorsController < ApplicationController
  def new
    @instructor = Instructor.new
  end
  
  def index
    @instructors = Instructor.all
  end
  
  def show
    @instructor = Instructor.find(params[:id])
  end
  
  def create
    @instructor = Instructor.new(instructor_params)
    @instructor.user_id = current_user.id
    if @instructor.save
      redirect_to instructors_path, notice: "You have created book successfully."
    else
      @request_board = RequestBoard.all
      render 'new'
    end
  end
end

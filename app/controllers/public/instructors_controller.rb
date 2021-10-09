class Public::InstructorsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def new
    @instructor = Instructor.new
  end

  def index
    @instructors = Instructor.page(params[:page]).reverse_order
  end

  def show
    @instructor = Instructor.find(params[:id])
  end

  def create
    @instructor = Instructor.new(instructor_params)
    @instructor.user_id = current_user.id
    if @instructor.save
      redirect_to root_path, notice: "You have created book successfully."
    else
      render 'new'
    end
  end

  private

  def instructor_params
    params.require(:instructor).permit(:age, :personality, :self_introduction, :message)
  end
end

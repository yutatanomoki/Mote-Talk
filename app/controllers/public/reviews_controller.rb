class Public::ReviewsController < ApplicationController
  before_action :authenticate_user!

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to instructors_path
    else
      @instructor = Instructor.find(params[:instructor_id])
      render "instructors/show"
    end
  end

  private
  def review_params
    params.permit(:instructor_id, :score, :content)
  end

end

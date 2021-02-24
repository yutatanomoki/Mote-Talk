class Public::FavoritesController < ApplicationController
  before_action :authenticate_user!

  
  def create
    @instructor = Instructor.find(params[:instructor_id])
    favorite = @instructor.favorites.new(user_id: current_user.id)
    favorite.save
  end

  def destroy
    @instructor = Instructor.find(params[:instructor_id])
    favorite = @instructor.favorites.find_by(user_id: current_user.id)
    favorite.destroy
  end

end

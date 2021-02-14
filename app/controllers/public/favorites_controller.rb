class Public::FavoritesController < ApplicationController
  before_action :authenticate_user!
  
  def create
    current_user.favorite(params[:user_id])
    redirect_to request.referer
  end
  
  def destroy
    current_user.unfavorite(params[:user_id])
    redirect_to request.referer
  end
  
  def favorites
     user = User.find(params[:user_id])
     @users = user.favorites
  end

  
end

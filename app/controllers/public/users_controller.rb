class Public::UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @profile_image = @user.profile_image.page(params[:page]).reverse_order
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = current_user
    user.update(user_params)
    redirect_to root_path
  end

  def quit
  end

  def goodbye
    @user = current_customer
    @user.update(membership_status: false)
    reset_session
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :profile_image)
  end
end

class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end
    
  def edit
    @user = User.find(params[:id])
  end
    
  def update
    customer = current_customer
    customer.update(customer_params)
    redirect_to user_path
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
    params.require(:user).permit(:name, :email, :image_id)
  end
end

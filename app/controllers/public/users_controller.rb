class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @user = current_customer
  end
    
  def edit
    @user = current_customer
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

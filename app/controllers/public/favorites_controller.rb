class Public::FavoritesController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    favorite = current_user.favorites.new(user_id: @user.id)
    favorite.save
  end

  def destroy
    @user = User.find(params[:user_id])
    favorite = current_user.favorites.find_by(user_id: @user.id)
    favorite.destroy
  end
  
  def create
    @follow = current_user.active_relationships.build(follower_id: params[:user_id])
    # 通知機能（userはフォローされた人）
    # フォロー機能（非同期）
    @user = User.find(params[:user_id])
    if @follow.save
      # 通知機能
      @user.create_notification_followed_by(current_user)
      # 非同期のため下記削除
      # redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    # フォロー機能（非同期）
    @user = User.find(params[:user_id])
    @follow = current_user.active_relationships.find_by(follower_id: params[:user_id])
    if @follow.destroy
      # 非同期のため下記削除
      # redirect_back(fallback_location: root_path)
    end
  end
end

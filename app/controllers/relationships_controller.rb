class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  # フォロー/アンフォローのコントローラー
  def create
    current_user.follow(params[:user_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    current_user.unfollow(params[:user_id])
    redirect_back(fallback_location: root_path)
  end

  # フォロー/フォロワーの一覧を表示するコントローラー
  def followings
    user = User.find(params[:user_id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:user_id])
    @users = user.followers
  end
end

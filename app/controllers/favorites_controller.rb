class FavoritesController < ApplicationController
  before_action :authenticate_user!

  # いいねのコントローラー
  def create
    @train = Train.find(params[:train_id])
    favorite = @train.favorites.new(user_id: current_user.id)
    favorite.save
  end

  def destroy
    @train = Train.find(params[:train_id])
    favorite = @train.favorites.find_by(user_id: current_user.id)
    favorite.destroy
  end
end

class UsersController < ApplicationController
  before_action :authenticate_user!

  # ユーザーのコントローラー
  def show
    @user = current_user
    @train = @user.trains
    @trains = @train.page(params[:page]).reverse_order.per(5)
  end
end

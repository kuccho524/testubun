class UsersController < ApplicationController
  before_action :authenticate_user!

  # ユーザーのコントローラー
  def show
    @user = User.find(params[:id])
    @train = @user.trains
    @trains = @train.page(params[:page]).reverse_order.per(5)
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render "edit"
    else
      redirect_to user_path(current_user)
    end
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "You have updated user successfully."
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end

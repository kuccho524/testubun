class UsersController < ApplicationController

  # ユーザーのコントローラー
  def trains
    @user = current_user
    @trains = @user.trains.reverse_order
  end

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to users_path, notice: "更新しました"
    else
      render :edit, notice: "更新に失敗しました"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction)
  end
end

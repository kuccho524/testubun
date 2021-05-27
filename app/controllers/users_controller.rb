class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @trains = @user.trains
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render :edit
    else
      redirect_to root_path, notice: "他のユーザーは編集できません"
    end
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "更新しました"
    else
      render :edit, notice: "更新に失敗しました"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end

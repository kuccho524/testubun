class TrainsController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  # 電車のコントローラー
  def index
    @user = current_user
    @trains = @user.trains.reverse_order
  end

  def show
    @train = Train.find(params[:id])
    @user = current_user
  end

  def edit
    @train = Train.find(params[:id])
    @user = current_user
    if @train.user == current_user
      render :edit
    else
      redirect_to root_path, notice: "投稿者以外編集できません"
    end
  end

  def new
    @train = Train.new
  end

  def create
    @train = Train.new(train_params)
    @train.user_id = current_user.id
    if @train.save
      redirect_to train_path(@train), notice: "投稿できました"
    else
      render :top, notice: "投稿に失敗しました"
    end
  end

  def update
    @train = Train.update(train_params)
    @train.user_id = current_user.id
    if @train.save
      redirect_to train_path(@train), notice: "更新しました"
    else
      render :edit, notice: "更新に失敗しました"
    end
  end

  def destroy
    @train = Train.find(params[:id])
    @train.destroy
    redirect_to :index, notice: "削除しました"
  end

  private

  def train_params
    params.require(:train).permit(:train_image, :company, :body)
  end
end

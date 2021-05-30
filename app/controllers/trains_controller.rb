class TrainsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  # 電車のコントローラー
  def index
    @trains = Train.page(params[:page]).reverse_order.per(8)
  end

  def show
    @train = Train.find(params[:id])
    @user = current_user
    @train_comment = TrainComment.new
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
      render :new
    end
  end

  def update
    @train = Train.find(params[:id])
    if @train.update(train_params)
      redirect_to train_path(@train), notice: "更新しました"
    else
      render :edit
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

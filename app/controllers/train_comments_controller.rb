class TrainCommentsController < ApplicationController

  # コメントのコントローラー
  def create
    @train = Train.find(params[:train_id])
    @train_comment = TrainComment.new(train_comment_params)
    @train_comment.train_id = @train.id
    @train_comment.user_id = current_user.id
    @train_comment.save
  end

  def destroy
    @train = Train.find(params[:train_id])
    train_comment = TrainComment.find(params[:id])
    train_comment.destroy
  end

  private

  def train_comment_params
    params.require(:train_comment).permit(:comment)
  end
end

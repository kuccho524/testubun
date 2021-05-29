class HomesController < ApplicationController

  # topページ
  def top
    @user = current_user
    @train = Train.page(params[:page]).reverse_order.per(8)
  end

end

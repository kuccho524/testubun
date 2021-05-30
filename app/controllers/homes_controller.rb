class HomesController < ApplicationController

  # topページ
  def top
    @user = current_user
    @train = Train.all.reverse_order
  end

end

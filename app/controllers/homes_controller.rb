class HomesController < ApplicationController

  # topページ
  def top
    @user = current_user
    @train = Train.all
  end

end

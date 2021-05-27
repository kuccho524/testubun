class HomesController < ApplicationController

  # topページ
  def top
    @user = current_user
    @trains = Train.all
  end

end

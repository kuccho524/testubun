class HomesController < ApplicationController

  # topページ
  def top
    @train = Train.all.reverse_order
  end

end

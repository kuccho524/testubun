class SearchesController < ApplicationController
  
  def search
    @trains = Train.looks(params[:search]).page(params[:page]).reverse_order.per(5)
  end
end

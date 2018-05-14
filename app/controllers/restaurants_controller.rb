class RestaurantsController < ApplicationController
  

  def index
    @restaurants = Restaurant.order(:created_at).page(params[:page]).per(9)
    @categories = Category.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

end

class Admin::RestaurantsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin

  before_action :set_restaurant, only: [:show, :edit, :update]

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      flash[:notice] = "A new pin has been put down."
      redirect_to admin_restaurants_path
    else
      flash.now[:alert] = "Failed to nail the pin."
      render :new
    end
  end

  def update
    if @restaurant.update(restaurant_params)
      flash[:notice] = "You've updated this pin info."
      redirect_to admin_restaurant_path(@restaurant)
    else
      flash.now[:alert] = "Failed to update."
      render :edit
    end
  end



  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :opening_hour, :tel, :address, :description)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end



end

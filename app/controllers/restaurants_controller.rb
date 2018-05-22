class RestaurantsController < ApplicationController
  
  before_action :set_restaurant, except: [:index, :feeds, :ranking]


  def index
    @restaurants = Restaurant.order(:created_at).page(params[:page]).per(9)
    @categories = Category.all
  end

  def show
    @comment = Comment.new
    @comments = @restaurant.comments.order(created_at: :desc)
  end

  def feeds
    @recent_restaurants = Restaurant.order(created_at: :desc).limit(10)
    @recent_comments = Comment.order(created_at: :desc).limit(15)
  end

  def dashboard
  end

  def favorite
    current_user.favorites.create(restaurant: @restaurant)
    @restaurant.count_favor
    redirect_back(fallback_location: root_path)
  end

  def unfavorite
    favorites = Favorite.where(restaurant: @restaurant, user: current_user)
    favorites.destroy_all
    redirect_back(fallback_location: root_path)
  end

  def like
    Like.create(restaurant: @restaurant, user: current_user)
    redirect_back(fallback_location: root_path)
  end

  def unlike
    likes = Like.where(restaurant: @restaurant, user: current_user)
    likes.destroy_all
    @restaurant.count_favor
    redirect_back(fallback_location: root_path)
  end

  def ranking
    @restaurants = Restaurant.order(favor_count: :desc).limit(10)
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

end

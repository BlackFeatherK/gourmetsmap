class Admin::CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin

  def index
    @categories = Category.all
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "A new category is suscessfully created!"
      redirect_to admin_categories_path
    else
      @categories = Category.all
      flash[:alert] = "You can't create without a name!"
      render :index
    end   
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

end

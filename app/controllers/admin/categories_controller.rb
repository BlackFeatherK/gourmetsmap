class Admin::CategoriesController < Admin::BaseController
  
  
  before_action :set_category, only: [:update, :destroy]

  def index
    @categories = Category.all

    if params[:id]
      @category = Category.find(params[:id])
    else
      @category = Category.new
    end
  end

  def update
    
    if @category.update(category_params)
      redirect_to admin_categories_path
      flash[:notice] = "Updated suscessfully!"
    else
      @categories = Category.all
      render :index
    end
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "A new category is suscessfully created!"
      redirect_to admin_categories_path
    else
      @categories = Category.all
      render :index
    end   
  end

  def destroy
    
    @category.destroy
    flash[:alert] = "You've deleted category #{@category.name}!"
    redirect_to admin_categories_path
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end

end

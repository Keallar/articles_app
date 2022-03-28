class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show destroy]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.valid?
      @category.save
      flash[:notice] = 'Category was created!'
      redirect_to @category
    else
      render :new
    end
  end
  
  def show
    # @category = Category.find
  end

  def destroy
    @category.destroy
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end

class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show destroy]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end
  
  def show; end

  def destroy
    @category.destroy
    # flash[:notice] = 'Article was succesfully destroyed!'
    # redirect_to articles_path
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end

end

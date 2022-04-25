class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show destroy]
  before_action :require_admin, except: %i[index show]

  def index
    @categories = Category.paginate(page: params[:page], per_page: 5)
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

  def show; end

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

  def require_admin
    unless logged_in? && current_user.admin?
      flash[:alert] = "Only admins can perform that action"
      redirect_to category_path
    end
  end
end

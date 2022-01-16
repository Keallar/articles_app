class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    # Rails.logger.info('New article')
    @article = Article.new
  end

  def create
    @article = Article.new(params.require(:article).permit(:title, :description))
    # render plain: @article.inspect
    if @article.save
      flash[:notice] = 'Article was created succesfully.'
      # redirect_to article_path(@article)
      redirect_to @article
    else
      render 'new'
    end
  end

  def edit; end

  def destroy; end

  private

  def method_name
    
  end
  
end

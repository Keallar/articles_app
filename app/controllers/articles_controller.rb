class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]
  after_action :previous_url, only: [:new]

  def index
    @articles = Article.all
  end

  def show; end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    # render plain: @article.inspect
    if @article.valid?
      @article.save
      flash[:notice] = 'Article was created succesfully.'
      Rails.logger.info('New article')
      redirect_to @article
    else
      render :new
    end
  end

  def edit; end

  def update
    if @article.update(article_params)
      redirect_to @article, notice: 'Article was succesfully updated!'
    else
      render action: 'edit'
    end
  end

  def destroy
    @article.destroy if @article.present?
    redirect_to(articles_path)
  end

  def previous_url
    session[:return_to] ||= request.referer
  end
  

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end
end

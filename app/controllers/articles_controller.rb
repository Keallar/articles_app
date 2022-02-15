class ArticlesController < ApplicationController
  before_action :set_article, only: %i[edit update show destroy]
  before_action :require_user, except: %i[index show]
  before_action :require_same_user, only: %i[edit update destroy]
  after_action :previous_url, only: [:new]

  def index
    @articles = Article.paginate(page: params[:page], per_page: 5)
    # store_last_index_page
  end

  def show; end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
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
    @article.destroy 
    Rails.logger.info("Article #{@article.title} deleted")
    flash[:notice] = 'Article was succesfully destroyed!'
    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end

  def require_same_user
    if current_user != @article.user
      flash[:alert] = 'You can only edit or delete your own article'
      redirect_to @article
    end
  end

  def previous_url
    session[:return_to] ||= request.referer
  end
end

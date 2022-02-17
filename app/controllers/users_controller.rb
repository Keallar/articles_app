class UsersController < ApplicationController
  before_action :set_user, only: %i[edit update show destroy]
  before_action :require_user, only: %i[edit update]
  before_action :require_same_user, only: %i[edit update destroy]

  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end

  def show
    @articles = @user.articles.paginate(page: params[:page], per_page: 5)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      flash[:notice] = "User #{@user.username} was succesfully signed up"
      Rails.logger.info("User #{@user.username} created")
      redirect_to @user
    else
      render :new
    end
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: "User #{@user.username} was succesfully updated!"
    else
      render :edit
    end
  end

  def destroy 
    @user.destroy
    Rails.logger.info("Article #{@user.username} deleted")
    session[:user_id] = nil if @user == current_user
    flash[:notice] = 'Account and all associated articles deleted'
    redirect_to root
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
    if current_user != @user && !current_user.admin?
      flash[:alert] = 'You can only edit or delete your profile'
      redirect_to current_user
    end
  end
end

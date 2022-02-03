class UsersController < ApplicationController
  before_action :set_user, only: %i[edit update show destroy]

  def show
    @user = User.find(params[:id])
    @articles = @user.articles
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      flash[:notice] = "User #{@user.username} was succesfully signed up"
      Rails.logger.info("User #{@user.username} created")
      redirect_to articles_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to articles_path, notice: "User #{@user.username} was succesfully updated!"
    else
      render :edit
    end
  end

  def destroy; end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end
end

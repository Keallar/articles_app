class UsersController < ApplicationController

  def show; end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      flash[:notice] = "User was succesfully created"
      Rails.logger.info("User #{@user.username} created")
      redirect_to articles_path
    else
      render :new
    end      
  end

  def destroy
    
  end
  
  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
  
end
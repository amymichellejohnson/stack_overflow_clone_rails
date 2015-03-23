class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.authenticate(params[:email], params[:password])
    if @user
      flash[:notice] = "You have Successfully logged in"
      session[:user_id] = @user.id
      redirect_to questions_path
    else
      flash[:alert] = "Errors! There was a problem logging in"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have been logged out Successfully... fare thee well..."
    redirect_to questions_path
  end
end

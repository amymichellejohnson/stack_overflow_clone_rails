class UsersController < ApplicationController

  def create
    user = User.new(user_params)
    if user.save
      flash[:notice] = "Successfully Registered"
      UserMailer.signup_confirmation(user).deliver
      redirect_to questions_path
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end

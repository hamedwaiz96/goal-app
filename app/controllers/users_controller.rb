class UsersController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to(new_session_url)
    else
      flash[:errors] = "Invalid Email or Password"
      render :new
    end
  end

  def user_params
    params.require(:user).permit(:email, :password, :session_token)
  end
end

class UsersController < ApplicationController

  def loginpage
    @user = User.new
    render template: "users/login"
  end

  def login
    @user = User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
      session.clear
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to users_login_path
    end
  end

  def logout
    session.clear
    redirect_to root_path
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.admin = false
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to new_user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end

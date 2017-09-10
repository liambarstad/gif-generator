class AdminsController < ApplicationController

  def loginpage
    @admin = User.new
    render template: "admins/login"
  end

  def login
    @admin = User.find_by(username: params[:user][:username])
    if @admin && @admin.authenticate(params[:user][:password]) && @admin.admin
      session.clear
      session[:admin_id] = @admin.id
      flash[:message] = "Welcome #{current_user.username}! Logged in as Admin"
      redirect_to root_path
    else
      redirect_to admins_login_path
    end
  end

  def logout
    session.clear
    flash[:message] = "Logged out"
    redirect_to root_path
  end

end

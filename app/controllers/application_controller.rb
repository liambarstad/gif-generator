class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :find_favorite,
                :current_user,
                :require_user,
                :require_admin

  def find_favorite(user, gif)
    @find_favorite = Favorite.find_by(user: user, gif: gif)
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    elsif session[:admin_id]
      @current_user ||= User.find(session[:admin_id])
    end
  end

  def require_user
    render template: "users/need_login" unless session[:user_id] != nil || session[:admin_id] != nil
  end

  def require_admin
    render template: "public/404" unless session[:admin_id] != nil
  end

end

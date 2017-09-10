class FavoritesController < ApplicationController
  before_action :require_user

  def create
    Favorite.create(user: current_user, gif_id: params[:gif_id])
    redirect_to session[:previous]
  end

  def destroy
    favorite = Favorite.find(params[:id])
    favorite.destroy
    redirect_to session[:previous]
  end

end

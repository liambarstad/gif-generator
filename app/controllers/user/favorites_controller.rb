class User::FavoritesController < ApplicationController
  before_action :require_user

  def index
    @favorites = current_user.favorites
    render "users/favorites/index"
  end

end

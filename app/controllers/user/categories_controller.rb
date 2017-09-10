class User::CategoriesController < ApplicationController
  before_action :user_root
  before_action :require_user

  def index
    @categories = current_user.categories.uniq
    render "users/categories/index"
  end

  def show
    @category = Category.find(params[:id])
    @gifs = @category.gifs.find_all { |gif| gif.users.include?(current_user) }
    render "users/categories/show"
  end

  private

  def user_root
    session[:previous] = user_categories_path
  end

end

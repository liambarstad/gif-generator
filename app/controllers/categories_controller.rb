class CategoriesController < ApplicationController
  before_action :require_admin, only: [:new, :create, :destroy]
  before_action :find_category, only: [:show, :destroy]
  before_action :categories_root, only: [:index, :show]

  def index
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(name: params[:category][:name])
    if @category.save
      build_category_gifs
      redirect_to category_path(@category)
    else
      redirect_to new_category_path
    end
  end

  def destroy
    @category.category_gifs.destroy_all
    @category.destroy
    redirect_to session[:previous]
  end

  private

  def categories_root
    session[:previous] = categories_path
  end

  def find_category
    @category = Category.find(params[:id])
  end

  def build_category_gifs
    gifs = params[:category][:gifs]
    gifs.keys.each do |key|
      CategoryGif.create(user: current_admin, gif: Gif.find(key)) if gifs[key] == 1
    end
  end

end

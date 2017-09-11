class GifsController < ApplicationController
  before_action :require_admin, only: [:new, :create, :destroy]

  def index
    @gifs = Gif.all
    session[:previous] = gifs_path
  end

  def show
    @gif = Gif.find(params[:id])
    session[:previous] = gif_path(@gif)
  end

  def new
    @gif = Gif.new
    @searched_gifs = session[:searched_gifs]
  end

  def search
    data = Gif.search_for(params[:query])
    session[:searched_gifs] = Gif.get_urls(data)
    session[:query] = params[:query]
    redirect_to new_gif_path
  end

  def create
    @gif = Gif.new(name: params[:gif][:name], image_path: interpret_image_path)
    if @gif.save
      category = Category.find_or_create_by(name: session[:query])
      CategoryGif.find_or_create_by(category: category, gif: @gif)
      Favorite.create(user: current_user, gif: @gif)
      session.delete(:searched_gifs)
      session.delete(:query)
      redirect_to gif_path(@gif)
    else
      redirect_to new_gif_path
    end
  end

  def destroy
    @gif = Gif.find(params[:id])
    @gif.category_gifs.destroy_all
    @gif.favorites.destroy_all
    @gif.destroy
    redirect_to gifs_path
  end

  private

  def interpret_image_path
    params[:gif][:image_path].keys.find { |url| params[:gif][:image_path][url] == "1" }
  end

end

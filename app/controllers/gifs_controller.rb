class GifsController < ApplicationController
  
  def index
    @gifs = Gif.all
    session[:previous] = gifs_path
  end

  def show
    @gif = Gif.find(params[:id])
    session[:previous] = gif_path(@gif)
  end

end

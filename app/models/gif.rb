class Gif < ApplicationRecord
  has_many :favorites
  has_many :category_gifs
  has_many :categories, through: :category_gifs
  has_many :users, through: :favorites
  validates_presence_of :name, :image_path

  def self.search_for(query)
    require 'net/http'
    require 'json'
    url = "http://api.giphy.com/v1/gifs/search?q=#{string_to_url(query)}&api_key=25ed4d3593cb468ab591f8aa74562e70"
    resp = Net::HTTP.get_response(URI.parse(url))
    buffer = resp.body
    result = JSON.parse(buffer)
  end

  def self.get_urls(data)
    gif_array = data["data"]
    gif_array.reduce([]) do |urls, gif_data|
      urls << gif_data["images"]["fixed_height"]["url"]
    end
  end

  def self.top_ten_popular
    
  end

  def self.top_ten_trending

  end

  private

  def self.string_to_url(query)
    words = query.split
    final = words.reduce("") { |final, word| final += word + "+" }
    final[0..-1]
  end
end

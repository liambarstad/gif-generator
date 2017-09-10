class Gif < ApplicationRecord
  has_many :favorites
  has_many :category_gifs
  has_many :categories, through: :category_gifs
  has_many :users, through: :favorites
  validates_presence_of :name, :image_path
end

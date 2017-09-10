class Category < ApplicationRecord
  validates_presence_of :name
  has_many :category_gifs
  has_many :gifs, through: :category_gifs
  has_many :favorites, through: :gifs
  has_many :users, through: :gifs
end

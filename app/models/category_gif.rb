class CategoryGif < ApplicationRecord
  belongs_to :category
  belongs_to :gif
end

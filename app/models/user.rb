class User < ApplicationRecord
  has_secure_password validations: false
  has_many :favorites
  has_many :gifs, through: :favorites
  has_many :categories, through: :gifs
  validates_presence_of :username, :email, :password
  validates_uniqueness_of :username, :email
  validates_inclusion_of :admin, in: [true, false], default: true

  def favorited?(gif)
    favorite = Favorite.where(user: self, gif: gif)
    !(favorite.to_a.empty?)
  end

end

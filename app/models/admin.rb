class Admin < ApplicationRecord
  has_secure_password
  validates_presence_of :username, :email, :password_digest
  validates_uniqueness_of :email
end

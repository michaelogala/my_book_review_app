class User < ApplicationRecord
  has_many :books
  validates :first_name, :last_name, :username, presence: true
  has_secure_password
end

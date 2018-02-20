class User < ApplicationRecord
  has_many :books
  has_many :reviews
  has_many :likes
  validates :first_name, :last_name, :username, presence: true
  has_secure_password

  def full_name
    "#{first_name} #{last_name}"
  end
end

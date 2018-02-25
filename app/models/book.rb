class Book < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: 'user_id'
  has_many :reviews
  has_many :likes, as: :likeable

  validates :name, :author, presence: true
end

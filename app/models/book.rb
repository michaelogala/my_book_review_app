class Book < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: 'user_id'
  has_many :reviews

  validates :name, :author, presence: true
end

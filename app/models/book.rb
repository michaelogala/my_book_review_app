class Book < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: 'user_id'

  validates :name, :author, presence: true
end

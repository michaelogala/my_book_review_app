class User < ApplicationRecord
  has_many :books
  has_many :reviews, dependent: :destroy
  has_many :likes, dependent: :destroy
  validates :first_name, :last_name, :username, :password, :password_confirmation, presence: true
  has_secure_password

  def full_name
    "#{first_name} #{last_name}"
  end

  def liked?(subject)
    like(subject).present?
  end

  def like(subject)
    liked ||= likes.find_by(likeable: subject)
    liked
  end

  def reviewed_books
    Book.includes(reviews: :reviewer).select do |b|
      b.reviews.find { |r| r.reviewer.id == self.id }
    end
  end

  def favorite_books
    Book.includes(:likes).select do |b|
      b.likes.find { |l| l.user_id == self.id }
    end
  end
end

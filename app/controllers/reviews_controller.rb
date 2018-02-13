class ReviewsController < ApplicationController
  before_action :set_book

  def create
    @review = @book.reviews.build(review_params.merge(reviewer: current_user))
    if @review.save
      redirect_to @book, notice: 'Your comment was saved'
    else
      redirect_to @book, alert: @book.errors.full_messages.to_sentence
    end
  end

  def destroy
  end

  private

  def set_book
    @book = Book.find(params[:book_id])
  end

  def review_params
    params.require(:review)
          .permit(:comment)
  end
end

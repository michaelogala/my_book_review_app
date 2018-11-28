class ReviewsController < ApplicationController
  before_action :set_book
  before_action :set_review, only: %i[destroy like unlike]

  def create
    @review = @book.reviews.build(review_params.merge(reviewer: current_user))
    respond_to do |format|
      if @review.save
        format.html { redirect_to @book, notice: 'Your comment was saved' }
        format.js
      else
        format.html { redirect_to @book, alert: @book.errors.full_messages.to_sentence }
      end
    end
  end

  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to @book }
      format.js
    end
  end

  def like
    @review.likes.create user: current_user
    respond_to do |format|
      format.html { redirect_to @book }
      format.js { render 'review' }
    end
  end

  def unlike
    like = @review.likes.find(params[:like_id])
    like.destroy
    respond_to do |format|
      format.html { redirect_to @book }
      format.js { render 'review' }
    end
  end

  private

  def set_book
    @book = Book.find(params[:book_id])
  end

  def set_review
    @review = @book.reviews.find(params[:id])
  end

  def review_params
    params.require(:review)
          .permit(:comment)
  end
end

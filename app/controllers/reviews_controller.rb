class ReviewsController < ApplicationController
  before_action :set_book
  before_action :set_review, only: [:destroy, :like, :unlike]

  def create
    @review = @book.reviews.build(review_params.merge(reviewer: current_user))
    if @review.save
      redirect_to @book, notice: 'Your comment was saved'
    else
      redirect_to @book, alert: @book.errors.full_messages.to_sentence
    end
  end

  def destroy
    @review.destroy
    redirect_to @book
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

class ReviewLikesController < ApplicationController
  before_action :set_review, only: [:create]
  before_action :set_like, only: [:destroy]

  def create
    current_user.likes.create(likeable: @review)
    redirect_to @review.book
  end

  def destroy
    @like.destroy
    redirect_to @like.likeable.book
  end

  private

  def set_review
    @review = Review.find(params[:review_id])
  end

  def set_like
    @like = Like.find(params[:id])
  end
end

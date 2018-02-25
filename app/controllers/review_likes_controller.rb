class ReviewLikesController < ApplicationController
  before_action :set_likeable, only: [:create]
  before_action :set_like, only: [:destroy]

  def create
    current_user.likes.create(likeable: @likeable)
    redirect_to @likeable.book
  end

  def destroy
    @like.destroy
    redirect_to @like.likeable.book
  end

  private

  def set_likeable
    @likeable = if params.keys.include? 'review_id'
                  Review.find(params[:review_id])
                end
  end

  def set_like
    @like = Like.find(params[:id])
  end
end

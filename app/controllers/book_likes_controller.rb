class BookLikesController < ApplicationController
  before_action :set_book, only: [:create]
  before_action :set_like, only: [:destroy]

  def create
    current_user.likes.create(likeable: @book)
    redirect_to @book
  end

  def destroy
    @like.destroy
    redirect_to @like.likeable
  end

  private

  def set_book
    @book = Book.find(params[:book_id])
  end

  def set_like
    @like = Like.find(params[:id])
  end
end

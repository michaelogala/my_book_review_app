class BooksController < ApplicationController
  before_action :set_book, except: [:index, :new, :create]
  
  def index
    @books = Book.includes(:owner, :reviews).all
  end

  def new
    @book = current_user.books.new
  end

  def create
    @book = current_user.books.build(book_params)
    if @book.save
      redirect_to @book, notice: "You have added #{@book.name} your collection"
    else
      flash[:alert] = @book.errors.full_messages.to_sentence
      render 'new'
    end
  end

  def update
    if @book.update(book_params)
      redirect_to @book, notice: "Successfully updated"
    else
      flash[:alert] = @book.errors.full_messages.to_sentence
      set_book
      render 'edit'
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path, notice: 'Book deleted'
  end

  def like
    @book.likes.create user: current_user
    redirect_to @book
  end

  def unlike
    like = @book.likes.find params[:like_id]
    like.destroy
    redirect_to @book
  end

  private

  def book_params
    params.require(:book)
          .permit(
            :name,
            :author
          )
  end

  def set_book
    @book = Book.includes(:owner, reviews: [:likes, :reviewer]).find params[:id]
  end
end

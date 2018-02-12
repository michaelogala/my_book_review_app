class BooksController < ApplicationController
  before_action :set_book, except: [:index, :new, :create]
  
  def index
    @books = current_user.books
  end

  def new
    @book = current_user.books.new
  end

  def create
    @book = current_user.books.build(book_params)
    if @book.save
      redirect_to book_path(@book.name), notice: "You have added #{@book.name} your collection"
    else
      flash[:alert] = @book.errors.full_messages.to_sentence
      render 'new'
    end
  end

  def update
    if @book.update(book_params)
      redirect_to book_path(@book.name), notice: "Successfully updated"
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

  private

  def book_params
    params.require(:book)
          .permit(
            :name,
            :author
          )
  end

  def set_book
    @book = Book.find_by name: params[:name]
  end
end

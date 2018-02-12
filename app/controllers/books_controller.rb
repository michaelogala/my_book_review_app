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
      redirect_to books_path, notice: "You have added #{@book.name} your collection"
    else
      flash[:alert] = @book.errors
      render 'new'
    end
  end

  def show
  end
  
  def edit
  end

  def update
  end

  def destroy
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

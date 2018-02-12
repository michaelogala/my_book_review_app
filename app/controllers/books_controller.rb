class BooksController < ApplicationController
  def index
    @books = current_user.books
  end

  def new
  end

  def create
  end

  def show
  end
  
  def edit
  end

  def update
  end

  def destroy
  end
end

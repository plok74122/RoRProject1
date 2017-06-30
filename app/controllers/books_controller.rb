class BooksController < ApplicationController
  before_action :set_book, :only => [:show, :edit, :update, :destroy]
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to books_path
    else
      render new_book_path
    end
  end

  def show
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to book_path
    else
      render edit_book_path(@book)
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path
  end

  private
  
    def book_params
      params.require(:book).permit(:name, :description, :isbn)
    end

    def set_book
      @book = Book.find(params[:id])
    end

end

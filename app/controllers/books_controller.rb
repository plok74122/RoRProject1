class BooksController < ApplicationController
  before_action :set_book, :only => [:show, :edit, :update, :destroy]
  def index
    @books = Book.page(params[:page]).per(5)
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "成功新增 #{@book.name}"
      redirect_to books_path
    else
      flash[:alert] = "Name不可為空"
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @book.update(book_params)
      flash[:notice] = "成功修改資料"
      redirect_to book_path(:page => params[:page])
    else
      flash[:alert] = "Name不可為空"
      render :edit, :page => params[:page]
    end
  end

  def destroy
    flash[:notice] = "成功刪除 #{@book.name}"
    @book.destroy
    redirect_to books_path(:page => params[:page])
  end

  private
  
    def book_params
      params.require(:book).permit(:name, :description, :isbn)
    end

    def set_book
      @book = Book.find(params[:id])
    end

end

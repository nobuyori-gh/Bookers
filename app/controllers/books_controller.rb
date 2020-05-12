class BooksController < ApplicationController

  def top
  end

  def index
	@books = Book.all
	# viewへ渡すためのインスタンス変数に空モデルと定義
 	@book = Book.new
  end

  def show
  	@book = Book.find(params[:id])
  end

  # def new
 	# viewへ渡すためのインスタンス変数に空モデルと定義
 	# @book = Book.new
  # end

  def create
  	book = Book.new(book_params)
  	book.save
  	redirect_to book_path(book.id)
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
  	book = Book.find(params[:id])
  	book.update(book_params)
  	redirect_to book_path(book)
  end

private
  def book_params
  	params. require(:book).permit(:title, :body)
  end

end

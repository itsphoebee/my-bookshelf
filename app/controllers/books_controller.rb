require 'pry'
class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    #binding.pry
    if @book.save
       redirect_to book_path(@book)
     else render :new
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book= Book.find(params[:id])
  end

  def update
    @book= Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book)
    else
      render :edit
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :publication_year, :genre_id, :blurb, :author_id)
  end
end

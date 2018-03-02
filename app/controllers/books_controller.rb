require 'pry'
class BooksController < ApplicationController
  before_action :find_book, only: [:show, :edit, :update]
  before_action :must_be_admin, only: [:new, :create, :edit, :update, :destroy]

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
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to book_path(@book)
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path
  end

  private

  def find_book
    @book= Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :publication_year, :genre_id, :blurb, :author_id)
  end
end

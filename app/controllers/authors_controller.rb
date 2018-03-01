class AuthorsController < ApplicationController
  before_action :find_author, only: [:show, :edit, :update]
  def index
    @authors = Author.all
  end

  def new
    @author = Author.new
    @book = @author.books.build
  end

  def create
    @author = Author.new(author_params)
    if @author.save
       redirect_to author_path(@author)
     else render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @author.update(author_params)
      redirect_to author_path(@author)
    else
      render :edit
    end
  end

  private

  def find_author
    @author= Author.find(params[:id])
  end

  def author_params
    params.require(:author).permit(:name, :book_ids => [], books_attributes: [:title, :publication_year, :blurb, :genre_id])
  end
end

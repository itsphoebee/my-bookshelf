class AuthorsController < ApplicationController
  before_action :find_author, only: [:show, :edit, :update, :destroy]
  before_action :must_be_admin, only: [:new, :create, :edit, :update, :destroy]

  def index
    @authors = Author.order('name ASC')
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

  def destroy
    @author.destroy
    redirect_to authors_path
  end

  private

  def find_author
    @author= Author.find(params[:id])
  end

  def author_params
    params.require(:author).permit(:name, :book_ids => [], books_attributes: [:title, :publication_year, :blurb, :genre_id])
  end
end

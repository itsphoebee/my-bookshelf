class GenresController < ApplicationController
  before_action :find_genre, only: [:show, :edit, :update]

  def index
    @genres = Genre.all
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
       redirect_to genre_path(@genre)
    else render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @genre.update(genre_params)
      redirect_to genre_path(@genre)
    else
      render :edit
    end
  end

  private

  def find_genre
    @genre= Genre.find(params[:id])
  end

  def genre_params
    params.require(:genre).permit(:name, :description)
  end
end

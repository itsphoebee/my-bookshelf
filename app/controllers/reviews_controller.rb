class ReviewsController < ApplicationController
  before_action :find_review, only: [:show, :edit, :update, :destroy]
  before_action :find_book
  before_action :must_have_rights, only: [:edit, :update, :destroy]

  def index
    @reviews = find_book.reviews
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to book_path(@book)
    else
      render :new
    end
  end

  def show
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @review}
    end
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to book_path(@book)
    else
      render :edit
    end
  end

  def destroy
    @review.destroy
    redirect_to book_path(@review.book)
  end

  private

  def manageable
    @review.user == current_user || current_user.admin?
  end

  def must_have_rights
    return head(:forbidden) unless manageable
  end

  def find_book
    @book = Book.find(params[:book_id])
  end

  def find_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:content, :user_id, :book_id)
  end

end

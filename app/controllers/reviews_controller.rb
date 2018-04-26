class ReviewsController < ApplicationController
  before_action :find_review, only: [:show, :edit, :update, :destroy]
  before_action :find_book
  before_action :must_have_rights, only: [:edit, :update, :destroy]

  def index
    @reviews = @book.reviews
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @reviews}
    end
  end

  def new
    @review = @book.reviews.new
  end

  def create
    @review = @book.reviews.build(review_params)
    if @review.save
      render 'reviews/show',:layout => false
    else
      render :new
    end
  end

  def show
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

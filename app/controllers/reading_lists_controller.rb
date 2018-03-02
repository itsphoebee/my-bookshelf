require 'pry'
class ReadingListsController < ApplicationController
  before_action :find_list, only: [:show, :edit, :update, :destroy]
  before_action :must_have_rights, only: [:destroy]
  helper_method :manageable, :owner

  def index
    if params[:user_id] && @user = User.find_by_id(params[:user_id])
      @reading_lists = User.find_by_id(params[:user_id]).reading_lists
    else
      @reading_lists = ReadingList.all
    end
  end

  def new
    @reading_list = ReadingList.new
  end

  def create
    @reading_list = ReadingList.new(reading_list_params)
    if @reading_list.save
       redirect_to reading_list_path(@reading_list)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @reading_list.update(reading_list_params)
      redirect_to reading_list_path(@reading_list)
    else
      render :edit
    end
  end

  def destroy
    @reading_list.destroy
    redirect_to root_path
  end

  private

  def manageable
    @reading_list.user == current_user || current_user.admin?
  end

  def must_have_rights
    return head(:forbidden) unless manageable
  end

  def find_list
    @reading_list = ReadingList.find(params[:id])
  end

  def reading_list_params
    params.require(:reading_list).permit(:name, :user_id, :book_ids => [])
  end

end

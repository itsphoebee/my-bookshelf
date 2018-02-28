require 'pry'
class ReadingListsController < ApplicationController
  def index
    @reading_lists = ReadingList.all
  end

  def new
    @reading_list = ReadingList.new
  end

  def create
    @reading_list = ReadingList.new(reading_list_params)
    if @reading_list.save
       redirect_to reading_list_path(@reading_list)
    else render :new
    end
  end

  def show
    @reading_list = ReadingList.find(params[:id])
  end

  def edit
    @reading_list = ReadingList.find(params[:id])
  end

  def update
    @reading_list = ReadingList.find(params[:id])
    binding.pry
    if @reading_list.update(reading_list_params)
      redirect_to reading_list_params(@reading_list)
    else
      render :edit
    end
  end

  private

  def reading_list_params
    params.require(:reading_list).permit(:name, :user_id, :book_ids[])
  end

end

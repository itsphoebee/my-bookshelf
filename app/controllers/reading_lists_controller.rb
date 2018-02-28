class ReadingListsController < ApplicationController
  def index
    @readinglists = ReadingList.all
  end

  def show
    @readinglist = ReadingList.find(params[:id])
  end
end

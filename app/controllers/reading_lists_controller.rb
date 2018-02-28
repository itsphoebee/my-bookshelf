class ReadingListsController < ApplicationController
  def index
    @readinglists = ReadingList.all
  end
end

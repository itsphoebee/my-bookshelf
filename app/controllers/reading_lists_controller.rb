class ReadingListsController < ApplicationController
  def index
    @readinglists = Reading_List.all
  end
end

class BookmarksController < ApplicationController
  before_action :set_list, only: %i[new create]
    def new
      @list = List.find(params[:list_id])
      @bookmark = Bookmark.new
    end
    def create
      @bookmark = Bookmark.new(bookmark_paramws)
      @bookamrk.list = @bookmark
      if @bookmark.save
      redirect_to list_to_path(list)
      else
        render :new, status: :unprocessable_entity
      end
    end

    private
    def set_list
      @lists = List.find(params[:list_id])
    end

    def bookmark_params
      params.require(:bookmarks).permit(:comment)
    end
end

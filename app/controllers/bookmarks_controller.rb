class BookmarksController < ApplicationController
  before_action :set_list
  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    @bookmark.save
    redirect_to list_path(@list)
  end
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark = Bookmark.destroy
    redirect_to list_path(@bookmark.list)
  end

  private

  def set_list
    @list =List.find(params[:list_id])
  end

  def bookmark_params
    params.require(:bookmark.permit(:comment))
  end

end

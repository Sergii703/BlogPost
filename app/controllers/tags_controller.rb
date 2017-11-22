class TagsController < ApplicationController
  def show
    @tag = Tag.find.by(name: params[:id])
    @posts = @tag.posts
  end
end
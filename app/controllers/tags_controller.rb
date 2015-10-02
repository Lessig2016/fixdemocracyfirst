class TagsController < ApplicationController
  before_filter :require_admin

  def create
    @tag = Tag.create(params.require(:tag).permit(:name))
    redirect_to tags_url
  end
end
class PostsController < ApplicationController
  before_action :require_login!
  
  def new

  end

  def create

  end

  def edit

  end

  def updated

  end

  def show

  end

  def destroy

  end

  def index

  end

  private

  def posts_params
    params.require(:posts).permit(:title, :url, :content, :sub_id, :author_id)
  end
end

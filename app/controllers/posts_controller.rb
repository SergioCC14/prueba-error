class PostsController < ApplicationController


  def index
    @posts = Post.all
    @active_nav = 'post_index'
  end


end
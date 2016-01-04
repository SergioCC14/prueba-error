class PostsController < ApplicationController


  def index
    @posts = Post.all.group_by{ |t| [t.created_at.year, t.created_at.month]}
    @active_nav = 'post_index'
  end


end
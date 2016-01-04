class PostsController < ApplicationController


  def index
    @posts = Post.all.group_by{ |t| [t.created_at.year, t.created_at.month]}
    @active_nav = 'post_index'
  end

  def show
    if !(@post = Post.find_by(id: params[:id])).blank?
      render
      # Redirect permalink_show
    else
      # render_404
    end  
  end

  def permalink_show
    if !params[:permalink].blank? && !(@post = Post.find_by(permalink: params[:permalink])).blank?
      # Lógica con Permalink
    else
      # render_404
    end
  end


end
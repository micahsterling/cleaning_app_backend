class Api::PostsController < ApplicationController
  def index
    @posts = Post.all
    render 'index.json.jb'
  end

  def show
    @post = Post.find_by(id: params[:id])
    render 'show.json.jb'
  end

end



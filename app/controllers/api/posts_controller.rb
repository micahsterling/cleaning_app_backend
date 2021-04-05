class Api::PostsController < ApplicationController
  def index
    @posts = Post.all
    render 'index.json.jb'
  end

  def show
    @post = Post.find_by(id: params[:id])
    render 'show.json.jb'
  end

  def create
    @post = Post.new(
      title: params[:title],
      content: params[:content],
      user_id: params[:user_id],
      votes: params[:votes],
    )
    @post.save
    render 'show.json.jb'
  end
end



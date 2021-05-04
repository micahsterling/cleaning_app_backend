class Api::PostsController < ApplicationController
  def index
    @posts = Post.all.sort_by{|post| post[:title]}
    render 'index.json.jb'
  end

  def show
    @post = Post.find_by(id: params[:id])
    render 'show.json.jb'
  end

  def create
    p "current_user"
    p current_user.id
    p "current_user"
    @post = Post.new(
      title: params[:title],
      content: params[:content],
      user_id: current_user.id,
      category_id: params[:category_id],
      images: params[:images],
    )
    @post.save
    params[:tag_ids].each do |tag_id|
      posttag = PostTag.new(post_id: @post.id, tag_id: tag_id[:id] )
      posttag.save 
    end
    render 'show.json.jb'
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.title = params[:title] || @post.title
    @post.content = params[:content] || @post.content
    @post.user_id = params[:user_id] || @post.user_id
    @post.category_id = params[:category_id] || @post.category_id
    @post.tag_ids = params[:tag_ids] || @post.tag_ids
    # @post.name = params[:name] || @post.name
    if @post.save
      render 'show.json.jb'
    else
      render json: {errors: @post.errors.full_messages}, status: :bad_request
    end
    
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    render json: {message: "Post successfully destroyed!"}
  end
end



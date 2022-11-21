class Api::PostsController < ApplicationController
  def index
    @posts = Post.all.sort_by{|post| post[:title]}
    # render 'index.json.jb'
  end

  def show
    @post = Post.find_by(id: params[:id])
    # render 'show.json.jb'
  end

  def create
    post = Post.new(
      title: params[:title],
      content: params[:content],
      user_id: params[:user_id],
      category_id: params[:category_id],
      # images: params[:images],
    )
    post.save
    params[:tag_ids].each do |tag_id|
      posttag = PostTag.new(post_id: post.id, tag_id: tag_id[:id], user_id: post.user_id )
      posttag.save 
    end
    # render 'show.json.jb'
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.title = params[:title] || @post.title
    @post.content = params[:content] || @post.content
    @post.category_id = params[:category_id] || @post.category_id

    if params[:tag_ids]
      taglist = JSON.parse(params[:tag_ids])
      current_tags = PostTag.where(post_id: @post.id)
      if taglist.length < current_tags.count
        i = 0
        @posttag = current_tags.each do |posttag|
          if i+1 <= current_tags.count-1
            posttag.user_id = @post.user_id
            posttag.tag_id = taglist[i]  
            posttag.save
          else
            posttag.destroy
          end
          i = i + 1
        end
      elsif taglist.length > current_tags.count
        i = 0
        @posttag = current_tags.each do |posttag|
          posttag.user_id = @post.user_id
          posttag.tag_id = taglist[i]
          i = i + 1
        end
        while i < taglist.length do
          posttag = PostTag.new(post_id: @post.id, user_id: @post.user_id, tag_id:taglist[i])
          posttag.save
          i = i + 1
        end
      else
        i = 0
        @posttag = current_tags.each do |posttag|
          posttag.user_id = @post.user_id
          posttag.tag_id = taglist[i]
          posttag.save
          i = i + 1
        end
      end
    end
    if @post.save
      # render 'show.json.jb'
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



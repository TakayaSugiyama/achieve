class PostsController < ApplicationController
  def new 
    @post = Picture.new(flash[:post])
  end

  def create 
    @post = current_user.pictures.build(picture_params)
    #binding.pry
    if @post.save 
      redirect_to posts_path, notice: "投稿しました。"
    else   
      redirect_to new_post_path, flash: {post: @post, error_messages: @post.errors.full_messages}
    end
  end

  def index 
    @posts = Picture.all.order(updated_at: :desc)
  end

  private 

  def picture_params 
    params.require(:picture).permit(:description,:image)
  end
end

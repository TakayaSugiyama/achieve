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

  def show 
    @post = Picture.find(params[:id])
  end

  def destroy 
    @post = Picture.find(params[:id])
    @post.destroy
    redirect_to posts_url, notice: "投稿を削除しました。"
  end

  def edit 
    @post = Picture.find(params[:id])
  end

  def update 
    @post = Picture.find(params[:id])
    if @post.update(picture_params)
      redirect_to post_path(@post) , notice: "投稿を更新しました。"
    else
      redirect_to edit_post_path, flash: {post: @post, error_messages: @post.errors.full_messages}
    end
  end

  private 

  def picture_params 
    params.require(:picture).permit(:description,:image)
  end

end

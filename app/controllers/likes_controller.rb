class LikesController < ApplicationController
  def create
    post = Post.find params[:post_id]
    like = Like.new post: post, user: current_user
    if like.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def destroy
    like = current_user.likes.find params[:id]
    like.destroy
    redirect_to root_path
  end
end

class LikesController < ApplicationController
  def create
    post = Post.find params[:post_id]
    like = Like.new post: post, user: current_user
    if !(can? :like, post)
      redirect_to root_path, alert: 'access denied'
    elsif like.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def destroy
    like = current_user.likes.find params[:id]
    if can? :destroy, like
      like.destroy
      redirect_to root_path, notice: 'Like removed!'
    else
      redirect_to root_path, alert: 'access denied!'
    end
  end
end

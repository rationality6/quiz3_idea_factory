class MembersController < ApplicationController
  def create
    post = Post.find params[:post_id]
    member = Member.new post: post, user: current_user
    if member.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def destroy
    member = current_user.members.find params[:id]
    member.destroy
    redirect_to root_path
  end
end

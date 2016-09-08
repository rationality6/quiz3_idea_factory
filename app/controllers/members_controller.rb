class MembersController < ApplicationController
  def create
    post = Post.find params[:post_id]
    member = Member.new post: post, user: current_user
    if can? :member, member
      member.save
      redirect_to root_path
    else
      redirect_to root_path, alert: 'access denied'
    end
  end

  def destroy
    member = current_user.members.find params[:id]
    if can? :destroy, member
      member.destroy
      redirect_to root_path, notice: 'Like removed!'
    else
      redirect_to root_path, alert: 'access denied!'
    end
  end
end

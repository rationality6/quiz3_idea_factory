class CommentsController < ApplicationController
  before_action :comment_param

  def create
    @post = Post.find params[:post_id]
    @comment.post = @post
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        format.html { redirect_to post_path(@post), notice: 'Comment created!' }
        format.js { render :create }
      else
        format.html { render '/posts/show' }
        format.js { render }
      end
    end
  end

  def destroy
    byebug
    @comment = Comment.find params[:id]
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to post_path(@post.comment), notice: 'Comment deleted' }
      format.js   { render } # this renders /app/views/answers/destroy.js.erb
    end
  end

  private

  def comment_param
    @comment = Comment.new params.require(:comment).permit(:body)
  end
end

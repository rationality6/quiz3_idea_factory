class CommentsController < ApplicationController
  before_action :comment_param

  def create
    @post = Post.find params[:post_id]
    @comment.post = @post
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        format.html { redirect_to post_path(@post), notice: 'Answer created!' }
        format.js { render }
      else
        format.html { render '/posts/show' }
        format.js { render }
      end
    end
  end

  def destroy
    @answer = Answer.find params[:id]
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to question_path(@answer.question), notice: 'Answer deleted' }
      format.js   { render } # this renders /app/views/answers/destroy.js.erb
    end
  end

  private

  def comment_param
    @comment = Comment.new params.require(:comment).permit(:body)
  end
end

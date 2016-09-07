class CommentsController < ApplicationController
  def create
  @comment = Comment.new params.require(:comment).permit(:body)
  @post = Post.find params[:post_id]
  @comment.post = @post
  if @comment.save
    redirect_to post_path(@post), notice: 'Answer created!'
  else
    render '/posts/show'
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

end

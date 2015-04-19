class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @topic = @post.topic
    @comment = Comment.new
      authorize @comment
  end
    def create
      @post = Post.find(params[:post_id])
      @topic = @post.topic
      @comment = current_user.comments.build(comment_params)
      @comment.post = @post
        authorize @comment
      if @comment.save
        flash[:notice] = "Comment added"
        redirect_to [@topic,@post]
      else
        flash[:error] = "Sorry, there is an error: " + @comment.errors.full_messages.first
        redirect_to [@topic,@post]
      end
    end

private
  def comment_params
    params.require(:comment).permit(:body)
  end

end

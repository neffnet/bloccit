class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
      authorize @comment
  end

    def create
      @post = Post.find(params[:post_id])
      @comment = current_user.comments.build(comment_params)
      @comment.post = @post
      topic = @post.topic
        authorize @comment
      if @comment.save
        flash[:notice] = "Comment added"
        redirect_to [topic,@post]
      else
        flash[:error] = "Sorry, there is an error: " + @comment.errors.full_messages.first
        redirect_to [topic,@post]
      end
    end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    topic = @post.topic
    authorize @comment

    if @comment.destroy
      flash[:notice] = "Comment deleted"
      redirect_to [topic,@post]
    else
      flash[:error] = "Error: failed to delete the comment"
      redirect_to [topic,@post]
    end
  end

private
  def comment_params
    params.require(:comment).permit(:body)
  end

end

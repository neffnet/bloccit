class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
      authorize @comment
  end

    def create
      @post = Post.find(params[:post_id])
      @comments = @post.comments
      @comment = current_user.comments.build(comment_params)
      @comment.post = @post
      @new_comment = Comment.new

      authorize @comment

      if @comment.save
        flash[:notice] = "Comment created"
      else
        flash[:error] = "Sorry, there was an error. Please try again."
      end

      respond_to do |format|
        format.html
        format.js
      end
    end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    topic = @post.topic
    authorize @comment

    if @comment.destroy
      flash[:notice] = "Comment deleted"
    else
      flash[:error] = "Error: failed to delete the comment"
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

private
  def comment_params
    params.require(:comment).permit(:body)
  end

end

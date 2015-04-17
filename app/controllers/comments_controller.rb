class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:id])
    @comment = Comment.new
      authorize @comment
  end
    def create
      @post = Post.find(params[:id])
      @comment = current_user.comments.build(comment_params)
      @comment.post = @post
        authorize @comment
      if @comment.save
        flash[:notice] = "Comment added"
        redirect_to @post
      else
        flash[:error] = "Sorry, there is an error"
        redirect_to @post
      end
    end

private
  def comment_params
    params.require(:comment).permit(:body)
  end

end

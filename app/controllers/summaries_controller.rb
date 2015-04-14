class SummariesController < ApplicationController
  def index

  end

  def new
    @post = Post.find(params[:post_id])
    @summary = Summary.new
      authorize(@summary)
  end

    def create
      @post = Post.find(params[:post_id])
      @summary =  Summary.new(params.require(:summary).permit(:body))
      @summary.post = @post
        authorize(@summary)

      if @summary.save
        flash[:notice] = "Post summary saved."
        redirect_to [@post,@summary]
      else
        flash[:error] = "Error saving your summary, please try again."
        render :new
      end
    end

  def show
    @post = Post.find(params[:post_id])
    @summary = @post.summary
    @topic = Topic.find(params[:topic_id])
  end

  def edit
    @post = Post.find(params[:post_id])
    @summary = @post.summary
    @topic = Topic.find(params[:topic_id])
  end

    def update
      @post = Post.find(params[:post_id])
      @summary = @post.summary
      @topic = Topic.find(params[:topic_id])
        # can update summary if user can update parent post
        authorize @summary
      if @summary.update_attributes(params.require(:summary).permit(:body))
        flash[:notice] = "Post was updated."
        redirect_to [@topic,@post,@summary]
      else
        flash[:error] = "There was an error updating your post. Please try again."
        render :edit
      end
    end
end
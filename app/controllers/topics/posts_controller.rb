class Topics::PostsController < ApplicationController
  def index
    @posts = Post.all
      authorize @posts
  end

  def show
    @post = Post.find(params[:id])
    @topic = Topic.find(params[:topic_id])
    @comments = @post.comments
      authorize @topic
      authorize @post
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
      authorize @post
  end

    def create
      @topic = Topic.find(params[:topic_id])
      @post = current_user.posts.build(post_params)
      @post.topic = @topic
        authorize @post
      if @post.save
        @post.create_vote
        flash[:notice] = "Post was saved."
        redirect_to [@topic,@post]
      else
        flash[:error] = "There was an error saving your post. Please try again."
        render :new
      end
    end

  def edit
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
      authorize @post
  end

    def update
      @post = Post.find(params[:id])
      @topic = Topic.find(params[:topic_id])
        authorize @post
      if @post.update_attributes(post_params)
        flash[:notice] = "Post was updated."
        redirect_to [@topic,@post]
      else
        flash[:error] = "There was an error updating your post. Please try again."
        render :edit
      end
    end

  def destroy
    @post = Post.find(params[:id])
    @topic = Topic.find(params[:topic_id])
    authorize @post

    if @post.destroy
      flash[:notice] = "Post: \"#{@post.title}\" has been deleted!"
      redirect_to @topic
    else
      flash[:error] = "Sorry, there was an error"
      render :show
    end
  end
    
  private

  def post_params
    params.require(:post).permit(:title,:body)
  end

end

class TopicsController < ApplicationController
  def index
    @topics = Topic.paginate(page: params[:page],per_page:10)
    authorize @topics
  end

  def new
    @topic = Topic.new
    authorize @topic
  end

    def create
      @topic = Topic.new(topic_params)
      authorize @topic
      if @topic.save
        redirect_to @topic,notice:"Topic was saved successfully."
      else
        flash[:error] = "Error creating topic. Please try again."
        render :new
      end
    end

  def show
    @topic = Topic.find(params[:id])
      @posts = @topic.posts.paginate(page:params[:page],per_page:10)
    authorize @topic
  end

  def edit
    @topic = Topic.find(params[:id])
    authorize @topic
  end

    def update
      @topic = Topic.find(params[:id])
      authorize @topic
      if @topic.update_attributes(topic_params)
        flash[:notice] = "The topic has been updated."
        redirect_to @topic
      else
        flash[:error] = "Error updating topic. Please try again."
        render :edit
      end
    end

  def destroy
    @topic = Topic.find(params[:id])
    authorize @topic
    if @topic.destroy
      redirect_to topics_path, notice:"Topic: \"#{@topic.name}\" was deleted!"
    else
      flash[:error] = 'There was an error, please try again.'
      render :show
    end
  end

    private

    def topic_params
      params.require(:topic).permit(:name,:description,:public)
    end
end

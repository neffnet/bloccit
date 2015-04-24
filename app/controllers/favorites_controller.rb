class FavoritesController < ApplicationController
  def destroy
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.find(params[:id])
      authorize favorite
    if favorite.destroy
      flash[:notice] = "This post no longer one of your favorites"
      redirect_to [post.topic,post]
    else
      flash[:error] = "There was an error, post is still in favorites"
      redirect_to [post.topic,post]
    end
  end

  def create
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post: post)
      authorize favorite
    if favorite.save
      flash[:notice] = "Post has been added to your favorites!"
      redirect_to [post.topic, post]
    else
      flash[:error] = "Error, topic not added to your favorites :("
      redirect_to [post.topic, post]
    end
  end
end

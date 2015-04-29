require 'rails_helper'

describe User do

  include TestFactories

  describe ".top_rated" do

    before do
      @user1 = create(:user)
      post = create(:post, user: @user1)
      create(:comment, user: @user1, post: post)

      @user2 = create(:user)
      post = create(:post, user: @user2)
      2.times { create(:comment, user: @user2, post: post) }
    end

    it "returns users ordered by comments + posts" do
      expect( User.top_rated ).to eq([@user2, @user1])
    end

    it "stores a `posts_count` on user" do
      users = User.top_rated
      expect( users.first.posts_count ).to eq(1)
    end

    it "stores a `comments_count` on user" do
      users = User.top_rated
      expect( users.first.comments_count ).to eq(2)
    end
  end

  describe "#favorited(post)" do

    before do
      @post = associated_post
      @user = authenticated_user
      @user2 = authenticated_user
      @favorite = @user2.favorites.create(post: @post)
    end

    it "returns `nil` if the user has not favorited the post" do
      expect( @user.favorited(@post) ).to be_nil
    end

    it "returns the appropriate favorite if it exists" do
      expect( @user2.favorited(@post) ).to_not be_nil
    end

    it "returns `nil` if the user has favorited another post" do
      other_post = associated_post(title:'some other post')
      other_favorite = @user.favorites.create(post: other_post)
      expect( @user.favorited(@post) ).to be_nil
    end
  end
end
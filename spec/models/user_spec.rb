require 'rails_helper'

describe User do

  include TestFactories

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
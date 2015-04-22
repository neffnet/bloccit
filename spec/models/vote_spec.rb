require 'rails_helper'

describe Vote do

  describe "validations" do

  before do
    @post = Post.create(title:'some title',body:'some content that is totally long enough to be a post body')
  end

    describe "value validation" do
      it "only allows -1 or 1 as values" do
        expect( @post.votes.create(value:2).valid? ).to eq( false )
        expect( @post.votes.create(value:0).valid? ).to eq( false )
        expect( @post.votes.create(value:'b').valid? ).to eq( false )
        expect( @post.votes.create(value:-1).valid? ).to eq( true )
      end
    end
  end
end

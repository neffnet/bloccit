describe Vote do

  describe "validations" do

  before do
    @post = Post.create(title:'some title',body:'some content')
  end

    describe "value validation" do
      it "only allows -1 or 1 as values" do
        expect( @post.votes.create(value:2).to eq( false ))
        expect( @post.votes.create(value:0).to eq( false ))
        expect( @post.votes.create(value:'b').to eq( false ))
        expect( @post.votes.create(value:-1).to eq( true ) )
      end
    end
  end
end
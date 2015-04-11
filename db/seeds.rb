require 'faker'

# Create Posts
50.times do 
  Post.create!(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph
    )
end
posts = Post.all

# Create Comments
100.times do
  Comment.create!(
      post: posts.sample,
      body: Faker::Lorem.paragraph
    )
end

# A unique post, only seed if it's not there
Post.create!(
  title:'A unique post', body:'This post is so unique. '*30
  ) unless !!Post.find_by(title: 'A unique post')
# Same deal for a unique comment
Comment.create!(
  post: posts.sample,
  body: "This is a unique comment"
  ) unless !!Comment.find_by(body:'This is a unique comment')

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
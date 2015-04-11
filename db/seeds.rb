require 'faker'

# Create Users
5.times do
  user = User.new(
    name: Faker::Name.name, email: Faker::Internet.email, password: Faker::Lorem.characters(10))
    user.skip_confirmation!
    user.save!
  end
  users = User.all

# Create Posts
50.times do 
  Post.create!(
    user: users.sample,
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph
    )
end
posts = Post.all

# Create Comments
100.times do
  Comment.create!(
      # user: users.sample,
      post: posts.sample,
      body: Faker::Lorem.paragraph
    )
end

# A unique post, only seed if it's not there
Post.where(title:'A unique post').first_or_create(
  body:'This post is so unique! '*30,
  user: users.sample)

# Same deal for a unique comment
Comment.create!(
  post: posts.sample,
  body: "This is a unique comment",
  # user: users.sample
  ) unless !!Comment.find_by(body:'This is a unique comment')

user = User.first
user.skip_reconfirmation!
user.update_attributes!(
  email: 'neff@neffnet.net',
  password: 'hellohello'
)

puts "Seed finished"
puts "#{Post.count} posts in database"
puts "#{Comment.count} comments in database"
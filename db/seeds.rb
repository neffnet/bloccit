require 'faker'

# Create Users
5.times do
  user = User.new(
    name: Faker::Name.name, email: Faker::Internet.email, password: Faker::Lorem.characters(10))
    user.skip_confirmation!
    user.save!
  end
  users = User.all

# Create Topics
  50.times do
    Topic.create!(name:'Topic ' + Faker::Lorem.sentence,description:Faker::Lorem.paragraph)
  end
  topics = Topic.all

# Create Posts
1000.times do 
  Post.create!(
    user: users.sample,
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph,
    topic: topics.sample
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

#  Create an admin user
  admin = User.new(
    name: 'Admin User',
    email: 'admin@example.com',
    password: 'helloworld',
    role: 'admin'
  )
  admin.skip_confirmation!
  admin.save!

#  Create a moderator
  moderator = User.new(
    name: 'Moderator User',
    email: 'moderator@example.com',
    password: 'helloworld',
    role: 'moderator'
  )
  moderator.skip_confirmation!
  moderator.save!

# Create a memer
  member = User.new(
    name: 'Member User',
    email: 'member@example.com',
    password: 'helloworld',
  )
  member.skip_confirmation!
  member.save!

puts "Seed finished"
puts "#{Post.count} posts in database"
puts "#{Comment.count} comments in database"

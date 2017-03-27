ActiveRecord::Base.transaction do
  users = 4.times.map do |index|
    User.create!(name: "bob#{index}", email: "bob#{index}@example.com")
  end

  posts = 8.times.map do |index|
    Post.create!(user: users.sample, body: "Lorem ipsum #{index}")
  end

  50.times.map do |index|
    Comment.create!(user: users.sample, post: posts.sample, body: "Comment lorem ipsum #{index}")
  end
end
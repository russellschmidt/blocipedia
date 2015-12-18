include RandomData

# Create Users
5.times do
  User.create!(
    email: RandomData.random_email,
    password: RandomData.random_password
  )
end

# create an admin user
User.create!(
  email: "reuvenschmidt@gmail.com",
  password: "12344321"
)

users = User.all
puts "#{User.count} users created"

25.times do
  Wiki.create!(
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph,
    private: false,
    user: users.sample
  )
end
puts "#{Wiki.count} wikis created"

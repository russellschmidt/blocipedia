include RandomData

# Create Users
5.times do
  User.create!(
    email: RandomData.random_email,
    password: RandomData.random_password
  )
end

3.times do
  User.create!(
  email: RandomData.random_email,
  password: RandomData.random_password,
  role: 'premium'
  )
end
# create an admin user
u = User.create!(
  email: "reuvenschmidt@gmail.com",
  password: "12344321",
)
u.admin!

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

User.where(role: 'premium').find_each do |pay_user|
  rand(3).times do
    Wiki.create!(
      title: RandomData.random_sentence,
      body: RandomData.random_paragraph,
      private: true,
      user: pay_user
    )
  end
end

puts "#{Wiki.count} wikis created"

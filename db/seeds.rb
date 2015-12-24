# FactoryGirl for users

10.times do
  FactoryGirl.create(:user)
end

#create my admin account
User.create!(
  email: "reuvenschmidt@gmail.com",
  password: "12344321",
  role: 'admin'
)

users = User.all

30.times do
  Wiki.create!(
    title: Faker::Hipster.sentence,
    body: Faker::Hipster.paragraph(2, true, 5),
    private: false,
    user: users.sample,
  )
end

User.where(role: 1).find_each do |user|
  3.times do
    Wiki.create!(
      title: Faker::Hipster.sentence,
      body: Faker::Hipster.paragraph(2, true, 5),
      private: true,
      user: user
    )
  end
end

=begin

# old data replaced by Faker data
# this used to be 1st line
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
=end

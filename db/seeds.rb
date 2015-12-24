# create Standard users
5.times do
  User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password(8,12),
    confirmed_at: Faker::Time.between(DateTime.now - 10, DateTime.now)
  )
end

#create Premium users
3.times do
  User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password(8,12),
    role: 'premium',
    confirmed_at: Faker::Time.between(DateTime.now - 10, DateTime.now)
  )
end

#create my admin account
User.create!(
  email: "reuvenschmidt@gmail.com",
  password: "12344321",
  role: 'admin'
)

users_all = User.all

25.times do
  Wiki.create!(
    title: Faker::Hipster.sentence,
    body: Faker::Hipster.paragraph(2, true, 5),
    private: false,
    user: users_all.sample,
  )
end

users_premium = User.where(role: 1).find_each do |premium_user|
  3.times do
    Wiki.create!(
      title: Faker::Hipster.sentence,
      body: Faker::Hipster.paragraph(2, true, 5),
      private: true,
      user: premium_user
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

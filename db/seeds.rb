# remember that this number includes the admin account below
standard_users_in_seed = 6
premium_users_in_seed = 3
admin_users_in_seed = 1

public_wikis_in_seed = 20
private_wikis_in_seed = 10

if User.where(role: 'standard').count < standard_users_in_seed
  (standard_users_in_seed - User.where(role: 'standard').count).times do
    FactoryGirl.create(:standard_user)
  end
end

if User.where(role: 'premium').count < premium_users_in_seed
  (premium_users_in_seed - User.where(role: 'premium').count).times do
    FactoryGirl.create(:premium_user)
  end
end

#create my admin account
User.create!(
  email: "reuvenschmidt@gmail.com",
  password: "12344321",
  role: 'admin'
)

users = User.all
puts "#{User.count} users created"
puts "#{User.where(role: 'standard').count} standard users"
puts "#{User.where(role: 'premium').count} premium users"
puts "#{User.where(role: 'admin').count} admin users"

####
if Wiki.where(private: false).count < public_wikis_in_seed
  (public_wikis_in_seed - Wiki.where(private: false).count).times do
    FactoryGirl.create(:public_wiki)
  end
end

if Wiki.where(private: true).count < private_wikis_in_seed
  (private_wikis_in_seed - Wiki.where(private: true).count).times do
    FactoryGirl.create(:private_wiki)
  end
end

puts "#{Wiki.count} wikis created"
puts "#{Wiki.where(private: false).count} public wikis created"
puts "#{Wiki.where(private: true).count} private wikis created"

=begin
20.times do
  Wiki.create!(
    title: Faker::Hipster.sentence,
    body: Faker::Hipster.paragraph(2, true, 5),
    private: false,
    user: users.sample
  )
end


User.where(role: 'premium').find_each do |pay_user|
  2.times do
    Wiki.create!(
      title: Faker::Hipster.sentence,
      body: Faker::Hipster.paragraph(2, true, 5),
      private: true,
      user: pay_user
    )
  end
end
=end



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

=end

include RandomData

# Create Users
5.times do
  User.create!(
    email: RandomData.random_email,
    password: RandomData.random_password
  )
end
users = User.all
puts "#{User.count} users created"
# Create Wiki

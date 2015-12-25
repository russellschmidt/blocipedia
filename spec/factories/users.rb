require 'faker'

FactoryGirl.define do
  factory :standard_user, class: User do
    email         { Faker::Internet.email }
    password      { Faker::Internet.password(8) }
    confirmed_at  { Faker::Time.between(DateTime.now - 10, DateTime.now) }
    role          'standard'
  end
end

FactoryGirl.define do
  factory :premium_user, class: User do
    email         { Faker::Internet.email }
    password      { Faker::Internet.password(8) }
    confirmed_at  { Faker::Time.between(DateTime.now - 10, DateTime.now) }
    role          'premium'
  end
end

FactoryGirl.define do
  factory :admin_user, class: User do
    email         { Faker::Internet.email }
    password      { Faker::Internet.password(8) }
    confirmed_at  { Faker::Time.between(DateTime.now - 10, DateTime.now) }
    role          'admin'
  end
end

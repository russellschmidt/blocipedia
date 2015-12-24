require 'faker'

FactoryGirl.define do
  factory :user do
    email         { Faker::Internet.email }
    password      { Faker::Internet.password(8) }
    confirmed_at  { Faker::Time.between(DateTime.now - 10, DateTime.now) }
    role          { rand(2) }
  end
end

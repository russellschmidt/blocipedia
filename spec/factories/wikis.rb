require 'faker'

FactoryGirl.define do
  factory :public_wiki, class: Wiki do
    title       { Faker::Hipster.sentence }
    body        { Faker::Hipster.paragraph(2, true, 5) }
    user        { User.find(rand(1..User.count)) }
    private     false
  end
end

# note that tables start IDs with 1 and not 0

FactoryGirl.define do
  factory :private_wiki, class: Wiki do
    title       { Faker::Hipster.sentence }
    body        { Faker::Hipster.paragraph(2, true, 5) }
    user        { User.where(role: 'premium').sample }
    private     true
  end
end

require 'faker'

FactoryGirl.define do
  factory :wiki do
    title       { Faker::Hipster.sentence }
    body        { Faker::Hipster.paragraph(2, true, 5) }
    user        { User.find(rand(User.count) + 1) }
    private     false
  end
end

# note that tables start IDs with 1 and not 0

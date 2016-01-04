require 'faker'
FactoryGirl.define do
  factory :collaborator do
    user        { User.find(rand(1..User.count)) }
    wiki        { Wiki.where(private: true).sample }
  end
end

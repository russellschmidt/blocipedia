require 'faker'
FactoryGirl.define do
  factory :collaboration do
    collaborator_id { User.find(rand(1..User.count)).id }
    wiki            { Wiki.where(private: true).sample }
  end
end

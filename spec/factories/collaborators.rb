require 'faker'
FactoryGirl.define do
  factory :collaborator, class: "Collaboration" do
    user        { User.find(rand(1..User.count)) }
    wiki        { Wiki.where(private: true).sample }
  end
end

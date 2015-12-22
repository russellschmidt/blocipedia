require 'rails_helper'

RSpec.describe User, type: :model do
  let(:new_user) { User.create!(email: 'newUser@aol.com', password:'password')}

  describe "valid user" do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:role) }

    it "should have a default role of standard" do
      expect(new_user.role).to eq 0
    end

    #it "valid logged in user is current_user" do
    #  expect(new_user.email).to equal(current_user.email)
    #end
  end

  describe "invalid user" do
    it { should_not allow_value("newUser.aol.com").for(:email) }
    it { should_not allow_value("newUser@aol").for(:email) }
  end
end

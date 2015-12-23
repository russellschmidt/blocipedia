require 'rails_helper'

RSpec.describe User, type: :model do
  let(:new_user) { User.create!(email: 'newUser@aol.com', password:'password')}

  describe "valid user" do
    context "standard user role" do
      it { should validate_presence_of(:email) }
      it { should validate_presence_of(:password) }
  
      it "should have a default role of standard" do
        expect(new_user.role).to eq "standard"
      end
    end

    context "premium user role" do
      before(:each) do
        new_user.premium!
      end

      it "should have a role of premium" do
        expect(new_user.role).to eq "premium"
      end
    end

    context "admin user role" do
      before(:each) do
        new_user.admin!
      end

      it "should have a role of admin" do
        expect(new_user.role).to eq "admin"
      end
    end

  end

  describe "invalid user" do
    it { should_not allow_value("newUser.aol.com").for(:email) }
    it { should_not allow_value("newUser@aol").for(:email) }
  end
end

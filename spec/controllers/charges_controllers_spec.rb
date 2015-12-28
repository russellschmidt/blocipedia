require 'rails_helper'
require 'stripe_mock'

RSpec.describe ChargesController, type: :controller do
  let(:my_user) {create(:standard_user)}
  let(:stripe_helper) { StripeMock.create_test_helper }
  before {StripeMock.start}
  after {StripeMock.stop}

  describe "GET #new" do
    context "for signed in user" do
      before(:each) do
        sign_in my_user
      end

      it "returns http success" do
        get :new
        expect(response).to have_http_status(:success)
      end
    end

    context "for guest user" do
      it "redirects to sign up page"  do
        get :new
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe "POST create" do
    context "for signed in user" do
      before(:each) do
        sign_in my_user
      end

      it "creates a stripe customer" do
        customer = Stripe::Customer.create({
          email: my_user.email,
          card: stripe_helper.generate_card_token
        })
        expect(customer.email).to eq(my_user.email)
      end
    end

    context "for guest user" do
      it "redirects to sign up page"  do
        get :new
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end

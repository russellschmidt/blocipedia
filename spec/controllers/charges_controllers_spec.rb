require 'rails_helper'
RSpec.describe WikisController, type: :controller do
    let(:my_user) {create(:standard_user)}

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

        it "returns http success" do
          post :create, charge: {}
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

end

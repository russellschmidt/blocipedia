require 'rails_helper'

RSpec.describe Collaboration, type: :model do
  let(:premium_user) {create(:premium_user)}
  let(:private_wiki) {create(:private_wiki, user: premium_user)}
  let(:collaborator) {create(:collaborator, wiki: private_wiki)}

  describe "collaborator attributes" do
    it "should respond to user_id" do
      expect(collaborator).to respond_to(:user_id)
    end

    it "should respond to wiki_id" do
      expect(collaborator).to respond_to(:wiki_id)
    end

  end
end

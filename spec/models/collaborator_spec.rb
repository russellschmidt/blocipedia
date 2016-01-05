require 'rails_helper'

RSpec.describe Collaboration, type: :model do
  let(:premium_user) {create(:premium_user)}
  let(:private_wiki) {create(:private_wiki, user: premium_user)}
  let(:collaboration) {create(:collaboration, wiki: private_wiki, collaborator_id: premium_user.id)}

  describe "collaboration attributes" do
    it "should respond to user_id" do
      expect(collaboration).to respond_to(:collaborator_id)
    end

    it "should respond to wiki_id" do
      expect(collaboration).to respond_to(:wiki_id)
    end

  end
end

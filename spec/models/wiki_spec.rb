require 'rails_helper'
include RandomData

RSpec.describe Wiki, type: :model do
  let(:my_user) {create(:standard_user)}
  let(:my_wiki) {create(:public_wiki, user: my_user)}
  let(:new_user) {create(:standard_user)}

  describe "Wiki attributes" do
    it "should respond to title" do
      expect(my_wiki).to respond_to(:title)
    end

    it "should respond to body" do
      expect(my_wiki).to respond_to(:body)
    end

    it "should respond to private" do
      expect(my_wiki).to respond_to(:private)
    end

    it "should respond to user" do
      expect(my_wiki).to respond_to(:user)
    end
  end

  describe "Wiki methods" do
    it "make_public should make private wikis public" do
      my_wiki.private = true
      my_wiki.make_public

      expect(my_wiki.private).to eq(false)
    end

    context "test collaboration add/remove methods" do
      before(:each) do
        @new_user = new_user
        @new_user.save
      end

      it "add_collab should create a collaboration object" do
        expect{ my_wiki.add_collab(collaborator_id: @new_user.id) }.to change(Collaboration, :count).by(1)
        #expect(Collaboration.count).to change(Co) 1
      end

      it "remove_collab should delete a collaboration object" do
        collab = Collaboration.new(collaborator_id: @new_user.id, wiki: my_wiki)
        collab.save
        
        expect{ my_wiki.remove_collab(@new_user.id) }.to change(Collaboration, :count).by(-1)
      end
    end
  end

end

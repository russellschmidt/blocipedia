require 'rails_helper'
include RandomData

RSpec.describe Wiki, type: :model do
  let(:user) {User.create!(email: RandomData.random_email, password: RandomData.random_password)}
  let(:wiki) {Wiki.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, private: false, user: user)}

  describe "Wiki attributes" do
    it "should respond to title" do
      expect(wiki).to respond_to(:title)
    end

    it "should respond to body" do
      expect(wiki).to respond_to(:body)
    end

    it "should respond to private" do
      expect(wiki).to respond_to(:private)
    end

    it "should respond to user" do
      exepct(wiki).to respond_to(:user)
    end
  end

end

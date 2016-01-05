require 'rails_helper'

RSpec.describe WikisHelper, type: :helper do
  describe "WikisHelper" do
    context "mardowner method" do
      it "should output markdown input correctly as html" do
        input = "#this is a title"

        expect(markdowner(input)).to eq("<h1>this is a title</h1>\n") #Note markdown adds a carriage return by default on block-level html
      end
    end
  end
end

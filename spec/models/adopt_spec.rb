require 'rails_helper'

RSpec.describe Adopt do
  it { should belong_to(:request) }
  it { should belong_to(:user) }
  it { should validate_presence_of :resume }
  it { should validate_presence_of :description }

  describe "#diff" do
    it "returns diff into request and adoption" do
      adopt = create(:adopt, description: "ab\nd", request: create(:request, description: "ab\nc"))
      expect(adopt.diff).to eq("<div class=\"diff\">\n  <ul>\n    <li class=\"unchanged\"><span>ab</span></li>\n    <li class=\"del\"><del>c</del></li>\n\n    <li class=\"ins\"><ins>d</ins></li>\n\n  </ul>\n</div>\n")
    end
  end
end

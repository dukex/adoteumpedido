require 'spec_helper'

describe Request do
  it { should have_many(:comments) }
  it { should have_many(:adopts) }
  it { should belong_to(:authority)}
  it { should validate_presence_of :resume }
  it { should validate_presence_of :description }

  describe "#confirmed_adopts" do
    let(:request){ create(:request) }
    it "returns confirmes adopts" do
      confirmed_adopts = 5.times.map{ create(:adopt, request: request, confirmed: true) }
      expect(request.confirmed_adopts).to eq(confirmed_adopts)
    end
    it "returns only confirmes adopts" do
      5.times.each{ create(:adopt, request: request, confirmed: false) }
      confirmed_adopts = 5.times.map{ create(:adopt, request: request, confirmed: true) }
      expect(request.confirmed_adopts).to eq(confirmed_adopts)
    end
  end
end

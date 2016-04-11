require 'rails_helper'

RSpec.describe Comment do
  it { should belong_to :request }
  it { should validate_presence_of :body }
end

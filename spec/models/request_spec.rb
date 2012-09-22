require 'spec_helper'

describe Request do
  it { should have_many(:comments) }
  it { should have_many(:adopts) }
  # it { should belong_to(:authority)}
end

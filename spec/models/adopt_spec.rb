require 'spec_helper'

describe Adopt do
  it { should belong_to(:request) }
  it { should belong_to(:user) }
  it { should validate_presence_of :resume }
  it { should validate_presence_of :description }
end
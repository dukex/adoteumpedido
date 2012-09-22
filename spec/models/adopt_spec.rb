require 'spec_helper'

describe Adopt do
  it { should belong_to(:request) }
  it { should belong_to(:user) }
end
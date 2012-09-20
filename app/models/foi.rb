class Foi < ActiveRecord::Base
  attr_accessible :description, :observation, :org, :resume

  has_many :comments
end

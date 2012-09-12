class Foi < ActiveRecord::Base
  attr_accessible :description, :observation, :org

  has_many :comments
end

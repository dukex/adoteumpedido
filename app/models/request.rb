class Request < ActiveRecord::Base
  attr_accessible :description, :observation, :resume

  has_many :comments
end

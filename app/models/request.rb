class Request < ActiveRecord::Base
  attr_accessible :description, :observation, :resume
  default_scope order("id DESC")
  has_many :comments
  has_many :adopts
end

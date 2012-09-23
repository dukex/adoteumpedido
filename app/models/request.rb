class Request < ActiveRecord::Base
  attr_accessible :description, :observation, :resume
  default_scope order("id DESC").includes(:comments)
  has_many :comments
  has_many :adopts

  validates :resume, presence: true
  validates :description, presence: true
end

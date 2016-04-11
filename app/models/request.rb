class Request < ActiveRecord::Base
  attr_accessible :description, :observation, :resume, :authority_id
  default_scope { order("id DESC").includes([:comments, :adopts]) }
  has_many :comments
  has_many :adopts

  belongs_to :authority

  validates :resume, presence: true
  validates :description, presence: true
  validates :authority_id, presence: true

  def confirmed_adopts
    adopts.confirmed
  end
end

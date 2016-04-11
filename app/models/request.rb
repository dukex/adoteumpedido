class Request < ActiveRecord::Base
  has_many :comments
  has_many :adopts
  belongs_to :authority

  validates :resume, presence: true
  validates :description, presence: true
  validates :authority_id, presence: true

  default_scope { order("id DESC").includes([:comments, :adopts]) }
end

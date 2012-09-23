class Adopt < ActiveRecord::Base
  attr_accessible :description, :request_id, :resume, :user_id
  belongs_to :request
  belongs_to :user

  validates :resume, presence: true
  validates :description, presence: true
end

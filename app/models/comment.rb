class Comment < ActiveRecord::Base
  attr_accessible :body, :request
  belongs_to :request

  validates :body, presence: true
end

class Comment < ActiveRecord::Base
  belongs_to :request

  validates :body, presence: true
  validates :request_id, presence: true
end

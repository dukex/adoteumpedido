class Comment < ActiveRecord::Base
  attr_accessible :body, :request
  belongs_to :request
end

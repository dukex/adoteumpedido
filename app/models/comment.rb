class Comment < ActiveRecord::Base
  attr_accessible :body, :foi
  belongs_to :foi
end

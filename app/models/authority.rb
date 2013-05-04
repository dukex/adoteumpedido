class Authority < ActiveRecord::Base
  attr_accessible :name, :url_name
  validates :url_name, uniqueness: true
end

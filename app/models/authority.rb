class Authority < ActiveRecord::Base
  validates :url_name, uniqueness: true
end

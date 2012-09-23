class Adopt < ActiveRecord::Base
  attr_accessible :description, :request_id, :resume, :user_id
  belongs_to :request
  belongs_to :user

  validates :resume, presence: true
  validates :description, presence: true


  def diff
    Diffy::Diff.new(request.description, description).to_s(:html_simple)
  end
end

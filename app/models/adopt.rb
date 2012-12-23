class Adopt < ActiveRecord::Base
  attr_accessible :description, :request_id, :resume, :confirmed
  belongs_to :request

  validates :resume, presence: true
  validates :description, presence: true

  scope :confirmed, where(confirmed: true)

  def diff
    Diffy::Diff.new(request.description, description).to_s(:html_simple)
  end
end

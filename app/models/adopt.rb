class Adopt < ActiveRecord::Base
  belongs_to :request
  belongs_to :user

  validates :resume, presence: true
  validates :description, presence: true

  scope :confirmed, -> { where confirmed: true }

  def diff
    Diffy::Diff.new(request.description, description).to_s(:html_simple)
  end
end

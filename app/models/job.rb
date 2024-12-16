class Job < ApplicationRecord
  belongs_to :company
  has_many :job_tags
  has_many :tags, through: :job_tags

  validates :title, :description, :salary, :location, presence: true
end

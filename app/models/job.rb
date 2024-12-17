class Job < ApplicationRecord
  belongs_to :company
  has_many :job_tags
  has_many :tags, through: :job_tags

  validates :title, :description, :salary, :location, presence: true

    # Ransackで検索可能な属性を指定
    def self.ransackable_attributes(auth_object = nil)
      ["id", "title", "description", "salary", "location", "employment_type", 
       "contact_info", "posted_at", "expires_at", "created_at", "updated_at"]
    end
  
    def self.ransackable_associations(auth_object = nil)
      ["company"]
    end
end

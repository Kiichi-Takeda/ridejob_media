class Tag < ApplicationRecord
  has_many :job_tags
  has_many :jobs, through: :job_tags

  validates :name, presence: true, uniqueness: true

    # Ransackで検索可能な属性を指定
    def self.ransackable_attributes(auth_object = nil)
      ["id", "name", "created_at", "updated_at"]
    end
end

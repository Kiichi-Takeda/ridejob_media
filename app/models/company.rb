class Company < ApplicationRecord
  has_many :jobs, dependent: :destroy

  validates :name, :address, :contact_number, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["id", "name", "address", "contact_number", "created_at", "updated_at"]
  end
end

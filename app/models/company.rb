class Company < ApplicationRecord
  has_many :jobs, dependent: :destroy

  validates :name, :address, :contact_number, presence: true
end

class Organizer < ApplicationRecord
  belongs_to :user
  has_many :events

  validates :company_name, presence: true
end

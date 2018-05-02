class Organizer < ApplicationRecord
  belongs_to :user
  has_many :events

  validates :company_name, presence: true, length: {in: 3..100}
end

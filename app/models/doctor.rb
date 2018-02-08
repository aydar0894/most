class Doctor < ApplicationRecord
  belongs_to :user

  has_many :event_doctors
  has_many :events, through: :event_doctors

  def events_available
    Event.where.not(id: self.events.ids)
  end
end

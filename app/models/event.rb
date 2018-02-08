class Event < ApplicationRecord
  belongs_to :organizer

  has_many :event_doctors
  has_many :doctors, through: :event_doctors

  has_many :event_operators
  has_many :operators, through: :event_operators

end

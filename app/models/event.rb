class Event < ApplicationRecord
  belongs_to :organizer

  has_many :event_doctors
  has_many :doctors, through: :event_doctors

  has_many :event_operators
  has_many :operators, through: :event_operators

  has_attached_file :logo,
    styles: { thumb: "100x100#" }
  validates_attachment_content_type :logo,
    content_type: /\Aimage/

  scope :open_to_register, -> {
    where('start > ?', Time.now)
  }

  scope :close_to_register, -> {
    where('start < ?', Time.now)
  }

  scope :currently_in_progress, -> {
    where('start < ? AND finish > ?', Time.now, Time.now)
  }

end

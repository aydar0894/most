class Doctor < ApplicationRecord
  belongs_to :user

  has_many :event_doctors
  has_many :events, through: :event_doctors
  has_many :specialities, through: :doctor_specialities

  has_attached_file :avatar,
    styles: { thumb: "75x100#" }
  validates_attachment_content_type :avatar,
    content_type: /\Aimage/

  validates :first_name, presence: true, length: {in: 2..30}
  validates :last_name, presence: true, length: {in: 2..30}
  validates :middle_name, presence: true, length: {in: 2..30}

  def events_available
    Event.where.not(id: self.events.ids).where("start > ?", Time.now)
  end

  def pending_events
    self.events.where("finish > ?", Time.now)
  end

  def archive_events
    self.events.where("finish < ?", Time.now)
  end

  def full_name
    "#{self.last_name} #{self.first_name} #{self.middle_name}"
  end
end

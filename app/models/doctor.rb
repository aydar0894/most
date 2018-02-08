class Doctor < ApplicationRecord
  belongs_to :user

  has_many :event_doctors
  has_many :events, through: :event_doctors


  has_attached_file :avatar,
    styles: { thumb: "75x100#" }
  validates_attachment_content_type :avatar,
    content_type: /\Aimage/

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

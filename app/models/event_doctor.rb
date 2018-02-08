class EventDoctor < ApplicationRecord
  self.primary_keys = :event_id, :doctor_id
  belongs_to :doctor
  belongs_to :event
  has_many :statuses, :class_name => 'EventDoctorStatus', :foreign_key => [:event_id, :doctor_id]
end

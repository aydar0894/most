class DoctorEventStatus < ActiveRecord::Base
  belongs_to :event_doctors, :foreign_key => [:event_id, :doctor_id]
end

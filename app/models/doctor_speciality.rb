class DoctorSpeciality < ApplicationRecord
    
    self.primary_keys = :speciality_id, :doctor_id
    belongs_to :doctor
    belongs_to :speciality
    has_many :statuses, :class_name => 'DoctorSpecialityStatus', :foreign_key => [:speciality_id, :doctor_id]
  
end

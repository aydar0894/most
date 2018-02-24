class DoctorSpecialityStatus < ActiveRecord::Base
    belongs_to :doctor_specialities, :foreign_key => [:speciality_id, :doctor_id]
  end
  
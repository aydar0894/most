class Speciality < ApplicationRecord
  has_many :doctor_specialities
  has_many :doctors, through: :doctor_specialities
end

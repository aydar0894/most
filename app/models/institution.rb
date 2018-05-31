class Institution < ApplicationRecord
  geocoded_by :address, :lattitude => :lat, :longitude => :lng
  after_validation :geocode, :if => :address_changed?

  has_many :doctors
  
end

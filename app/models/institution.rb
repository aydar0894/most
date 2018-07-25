class Institution < ApplicationRecord
  geocoded_by :address
  reverse_geocoded_by :latitude, :longitude

  after_validation :geocode, :if => :address_changed?

  has_many :doctors
  
end

class Institution < ApplicationRecord
  include Geosearchable

  geocoded_by :address
  # reverse_geocoded_by :latitude, :longitude

  after_validation :geocode, if: ->(obj) { obj.address.present? && obj.address_changed? }

  has_many :doctors
  
end

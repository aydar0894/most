class EventDoctor < ApplicationRecord
  belongs_to :doctor
  belongs_to :event
end

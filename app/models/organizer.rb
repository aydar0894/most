class Organizer < ApplicationRecord
  belongs_to :user
  has_many :events

<<<<<<< HEAD
  validates :company_name, presence: true
=======
  validates :company_name, presence: true, length: {in: 3..100}
>>>>>>> 9c1f502a3d1eecc8cbfb34bd06ebb614f46243ca
end

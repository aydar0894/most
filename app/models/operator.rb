class Operator < ApplicationRecord
  belongs_to :user

  validates :first_name, presence: true, length: {in: 2..30}
  validates :last_name, presence: true, length: {in: 2..30}
  validates :middle_name, presence: true, length: {in: 2..30}
end

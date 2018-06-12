class Organizer < ApplicationRecord
  belongs_to :user
  has_many :events

  validates :company_name, presence: true, length: {in: 3..100}

  has_attached_file :logo, styles: { high: "805x575#", medium: "387x277#", thumb: "200x200#" }, default_url: "missing_organizer.jpg"
    # default_url: ":style/missing_avatar.jpg"
  validates_attachment_content_type :logo,
    content_type: /\Aimage/
end

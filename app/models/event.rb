class Event < ApplicationRecord
  include Filterable

  geocoded_by :address
  after_validation :geocode, if: ->(obj) { obj.address.present? && obj.address_changed? }

  belongs_to :organizer

  has_many :event_doctors
  has_many :doctors, through: :event_doctors

  has_many :event_operators
  has_many :operators, through: :event_operators

  has_attached_file :logo, styles: { high: "805x575#", medium: "387x277#", thumb: "200x200#" }, default_url: "missing_event.jpg"
    # default_url: ":style/missing_avatar.jpg"
  validates_attachment_content_type :logo,
    content_type: /\Aimage/

  validates :title, presence: true, length: { in: 6..40 }
  validates :start, presence: true
  validates :finish, presence: true
  validate :finish_after_start

  scope :open_to_register, -> {
    where('start > ?', DateTime.current)
  }

  scope :close_to_register, -> {
    where('start < ?', DateTime.current)
  }

  scope :currently_in_progress, -> {
    where('start < ? AND finish > ?', DateTime.current, DateTime.current)
  }

  # :nocov:
  scope :search_query,  ->  (query) {
    return nil if query.blank?

    terms = query.mb_chars.downcase.to_s.split(/\s+/)
    terms = terms.map { |e|
      (e.gsub('*', '%') + '%').gsub(/%+/, '%')
    }

    num_or_conds = 2

    where(
      terms.map { |term|
        "(LOWER(events.title) LIKE LOWER(?) OR LOWER(events.description) LIKE LOWER(?))"
      }.join(' AND '),
      *terms.map { |e| [e] * num_or_conds }.flatten
    )
  }
  # :nocov:


  def start_time
    self.start
  end

  def end_time
    self.finish
  end


  private
  def finish_after_start
    if finish < start
      errors.add(:finish, "must goes after start")
    end
  end
end

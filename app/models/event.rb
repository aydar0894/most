class Event < ApplicationRecord
  include Filterable

  belongs_to :organizer

  has_many :event_doctors
  has_many :doctors, through: :event_doctors

  has_many :event_operators
  has_many :operators, through: :event_operators

  has_attached_file :logo,
    styles: { thumb: "100x100#" }
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

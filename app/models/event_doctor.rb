class EventDoctor < ApplicationRecord
  require 'rqrcode'
  after_initialize :qrcode_generate

  has_attached_file :qrcode,
    styles: { thumb: "100x100#" }
  validates_attachment_content_type :qrcode,
    content_type: /\Aimage/
  # validates_attachment :qrcode,
  #   content_type: { content_type: "image/*" }


  self.primary_keys = :event_id, :doctor_id
  belongs_to :doctor
  belongs_to :event
  has_many :statuses, :class_name => 'EventDoctorStatus', :foreign_key => [:event_id, :doctor_id]

  private

  # :nocov:
  def qrcode_generate
    if Gem.win_platform?
      t = "C:/temp/#{Time.current.to_i}.png"
    else
      t = "/tmp/tempfile#{Time.current.to_i}.png"
    end
    RQRCode::QRCode.new("#{self.doctor.user_id}").as_png(file:t)
    file = File.open(t)
    self.qrcode = file
    file.close
    File.delete(t)
    self.save
  end
  # :nocov:
end

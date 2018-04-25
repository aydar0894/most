class AddAttachmentQrcodeToEventDoctors < ActiveRecord::Migration[5.1]
  def self.up
    change_table :event_doctors do |t|
      t.attachment :qrcode
    end
  end

  def self.down
    remove_attachment :event_doctors, :qrcode
  end
end

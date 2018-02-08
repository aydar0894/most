class AddAttachmentLogoToEvents < ActiveRecord::Migration[5.1]
  def self.up
    change_table :events do |t|
      t.attachment :logo
    end
  end

  def self.down
    remove_attachment :events, :logo
  end
end

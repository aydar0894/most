class ConfigEventDoctors < ActiveRecord::Migration[5.1]
  def change
  	add_column :event_doctors, :last_in, :datetime
  	add_column :event_doctors, :last_out, :datetime
  	add_column :event_doctors, :event_time, :float
  end
end

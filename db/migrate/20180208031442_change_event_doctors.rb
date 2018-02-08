class ChangeEventDoctors < ActiveRecord::Migration[5.1]
  def change
  	change_column :event_doctors, :last_in, :datetime, :default => '2018-01-01'
  	change_column :event_doctors, :last_out, :datetime, :default => '2018-01-01'
  	change_column :event_doctors, :event_time, :float, :default => 0
  end
end

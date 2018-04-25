class AddIndexEventDoctorToEventDoctors < ActiveRecord::Migration[5.1]
  def change
    add_index :event_doctors, [:event_id, :doctor_id], unique: true
  end
end

class CreateEventDoctors < ActiveRecord::Migration[5.1]
  def change
    create_table :event_doctors do |t|
      t.references :event, foreign_key: true
      t.references :doctor, foreign_key: true
      t.integer :status
    end
  end
end

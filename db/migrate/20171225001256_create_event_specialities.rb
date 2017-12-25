class CreateEventSpecialities < ActiveRecord::Migration[5.1]
  def change
    create_table :event_specialities do |t|
      t.references :event, foreign_key: true
      t.references :speciality, foreign_key: true
      t.boolean :is_main
    end
  end
end

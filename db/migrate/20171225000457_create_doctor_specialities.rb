class CreateDoctorSpecialities < ActiveRecord::Migration[5.1]
  def change
    create_table :doctor_specialities do |t|
      t.references :doctor, foreign_key: true
      t.references :speciality, foreign_key: true
      t.boolean :is_main
    end
  end
end

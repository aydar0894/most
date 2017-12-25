class CreateDoctors < ActiveRecord::Migration[5.1]
  def change
    create_table :doctors do |t|
      t.text :first_name
      t.text :last_name
      t.text :middle_name
      t.datetime :birth_date
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

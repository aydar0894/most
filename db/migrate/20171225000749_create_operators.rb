class CreateOperators < ActiveRecord::Migration[5.1]
  def change
    create_table :operators do |t|
      t.text :first_name
      t.text :last_name
      t.text :middle_name
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

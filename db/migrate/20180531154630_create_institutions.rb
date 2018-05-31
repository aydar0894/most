class CreateInstitutions < ActiveRecord::Migration[5.1]
  def change
    create_table :institutions do |t|
      t.string :name
      t.float :lat
      t.float :lng
      t.string :address

      t.timestamps
    end

    add_index :institutions, [:lat, :lng]

  end
end

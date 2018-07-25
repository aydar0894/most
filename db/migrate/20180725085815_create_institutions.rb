class CreateInstitutions < ActiveRecord::Migration[5.1]
  def change
    create_table :institutions do |t|
      t.string :name
      t.string :address
      t.float :latitude
      t.float :longitude
    end

    add_index :institutions, [:latitude, :longitude]
  end
end

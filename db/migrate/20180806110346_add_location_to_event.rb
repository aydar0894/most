class AddLocationToEvent < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :latitude, :float
    add_column :events, :longitude, :float
    add_column :events, :address, :string

    add_index :events, [:latitude, :longitude]
    remove_column :events, :location
  end

  
end

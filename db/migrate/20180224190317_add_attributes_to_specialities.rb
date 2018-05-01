class AddAttributesToSpecialities < ActiveRecord::Migration[5.1]
  def change
    add_column :specialities, :parent, :integer
    add_column :specialities, :level, :integer    
  end
end

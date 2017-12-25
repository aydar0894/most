class CreateSpecialities < ActiveRecord::Migration[5.1]
  def change
    create_table :specialities do |t|
      t.text :title
    end
  end
end

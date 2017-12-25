class CreateOrganizers < ActiveRecord::Migration[5.1]
  def change
    create_table :organizers do |t|
      t.references :user, foreign_key: true
      t.text :company_name

      t.timestamps
    end
  end
end

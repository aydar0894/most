class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.references :organizer, foreign_key: true
      t.text :title
      t.datetime :start
      t.datetime :finish

      t.timestamps
    end
  end
end

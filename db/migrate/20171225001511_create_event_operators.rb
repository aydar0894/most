class CreateEventOperators < ActiveRecord::Migration[5.1]
  def change
    create_table :event_operators do |t|
      t.references :event, foreign_key: true
      t.references :operator, foreign_key: true
    end
  end
end

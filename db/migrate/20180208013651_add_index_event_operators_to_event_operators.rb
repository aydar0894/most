class AddIndexEventOperatorsToEventOperators < ActiveRecord::Migration[5.1]
  def change
    add_index :event_operators, [:event_id, :operator_id], unique: true
  end
end

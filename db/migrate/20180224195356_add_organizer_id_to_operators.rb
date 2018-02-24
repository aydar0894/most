class AddOrganizerIdToOperators < ActiveRecord::Migration[5.1]
  def change
    add_reference :operators, :organizer, foreign_key: true
  end
end

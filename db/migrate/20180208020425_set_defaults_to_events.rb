class SetDefaultsToEvents < ActiveRecord::Migration[5.1]
  def change
  	change_column :events, :reggistrations_count, :integer, :default => 0
  	change_column :events, :participants_count, :integer, :default => 0
  	change_column :events, :max_participants, :integer, :default => 0
  end
end

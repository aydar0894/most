class AddFieldsToEvent < ActiveRecord::Migration[5.1]
  def change
  	add_column :events, :reggistrations_count, :integer
  	add_column :events, :participants_count, :integer  	
  	add_column :events, :location, :text
  	add_column :events, :description, :text	 
  	add_column :events, :max_participants, :integer	 
  end
end

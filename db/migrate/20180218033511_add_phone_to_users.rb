class AddPhoneToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :phone, :string, null: false, unique: true
  end
end

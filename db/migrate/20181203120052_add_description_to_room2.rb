class AddDescriptionToRoom2 < ActiveRecord::Migration[5.2]
  def change
  	add_reference :room2s, :user, index: true
  	add_foreign_key :room2s, :users
  	add_column :room2s, :date_full, :datetime
  	add_column :rooms, :date_full, :datetime
  	remove_column :rooms, :empty_full
  	remove_column :room2s, :empty_full 
  end
end

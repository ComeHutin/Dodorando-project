class RemoveRoomsFromBeds < ActiveRecord::Migration[5.2]
  def change
  	change_table :dormitory_beds do |t|
      t.remove_references :room
      t.belongs_to :dormitory_room
    end
  end
end

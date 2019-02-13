class AddFreeRoomToOccupiedRoom < ActiveRecord::Migration[5.2]
  def change
    add_reference :occupied_rooms, :free_room, foreign_key: true, index: true
    
  end
end

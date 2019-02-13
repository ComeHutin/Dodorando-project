class AddRoomTypeToFreeRoom < ActiveRecord::Migration[5.2]
  def change
    add_reference :free_rooms, :room_type, foreign_key: true, index: true
  end
end

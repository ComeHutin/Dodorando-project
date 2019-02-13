class ChangeRoomsToDormitoryRooms < ActiveRecord::Migration[5.2]
  def self.up
    rename_table :rooms, :dormitory_rooms
  end

  def self.down
    rename_table :dormitory_rooms, :rooms
  end
end

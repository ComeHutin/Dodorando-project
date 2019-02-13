class ChangeRoom2sToRooms < ActiveRecord::Migration[5.2]
  def self.up
    rename_table :room2s, :rooms
  end

  def self.down
    rename_table :rooms, :room2s
  end
end

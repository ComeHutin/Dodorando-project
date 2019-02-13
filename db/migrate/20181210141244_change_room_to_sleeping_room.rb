class ChangeRoomToSleepingRoom < ActiveRecord::Migration[5.2]
  def self.up
    rename_table :rooms, :sleeping_rooms
  end

  def self.down
    rename_table :sleeping_rooms, :rooms
  end

end

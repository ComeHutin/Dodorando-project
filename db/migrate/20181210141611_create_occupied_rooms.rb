class CreateOccupiedRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :occupied_rooms do |t|

      t.belongs_to :booking, index: true, foreign_key: true
      t.timestamps
    end
  end
end

class CreateRoomTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :room_types do |t|
      t.string :description
      t.integer :capacity
      t.timestamps
    end
  end
end

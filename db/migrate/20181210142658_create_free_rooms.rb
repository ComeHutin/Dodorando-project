class CreateFreeRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :free_rooms do |t|
      t.integer :number_of_the_room
      t.string :name_of_the_room
      t.integer :status

      t.timestamps
    end
  end
end

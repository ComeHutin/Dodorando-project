class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.belongs_to :house
      t.integer :number_of_beds
      t.integer :empty_full #0 pour empty 1 pour full
      t.timestamps
    end
  end
end
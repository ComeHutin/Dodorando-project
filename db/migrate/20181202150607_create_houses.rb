class CreateHouses < ActiveRecord::Migration[5.2]
  def change
    create_table :houses do |t|
      t.belongs_to :city
      t.string :name
      t.text :description
      t.integer :number_of_rooms
      t.integer :empty_full #0 pour empty 1 pour full
      t.timestamps
    end
  end
end

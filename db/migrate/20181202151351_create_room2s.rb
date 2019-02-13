class CreateRoom2s < ActiveRecord::Migration[5.2]
  def change
    create_table :room2s do |t|
      t.belongs_to :house
      t.string :price
      t.integer :number_max #max de place dans la chambre
      t.integer :number_wanted #nombre d'utilisateurs de la chambre
      t.integer :empty_full #0 pour empty 1 pour full
      t.timestamps
    end
  end
end

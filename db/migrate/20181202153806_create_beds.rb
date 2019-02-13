class CreateBeds < ActiveRecord::Migration[5.2]
  def change
    create_table :beds do |t|
      t.belongs_to :room
      t.belongs_to :user, optional: true
      t.string :price
      t.integer :empty_full #0 pour empty 1 pour full
      t.timestamps
    end
  end
end

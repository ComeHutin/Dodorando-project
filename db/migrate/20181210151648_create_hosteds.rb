class CreateHosteds < ActiveRecord::Migration[5.2]
  def change
    create_table :hosteds do |t|
      t.references :user, foreign_key: true, index: true
      t.references :occupied_room, foreign_key: true, index: true
      t.timestamps
    end
  end
end

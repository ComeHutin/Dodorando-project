class CreateBed2s < ActiveRecord::Migration[5.2]
  def change
    create_table :bed2s do |t|
      t.belongs_to :room
      t.string :description
      t.timestamps
    end
  end
end

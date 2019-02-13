class AddHouseToFreeRoom < ActiveRecord::Migration[5.2]
  def change
    add_reference :free_rooms, :house, foreign_key: true, index: true
  end
end

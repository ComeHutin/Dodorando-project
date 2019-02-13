class AddColumnFreeRoom < ActiveRecord::Migration[5.2]
  def change
    add_column :free_rooms, :price_of_the_night, :float
  end
end

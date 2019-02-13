class AddDormitoryRoomToHouse < ActiveRecord::Migration[5.2]
  def change
	add_column :houses, :number_of_dormitory_rooms, :integer  
  end
end

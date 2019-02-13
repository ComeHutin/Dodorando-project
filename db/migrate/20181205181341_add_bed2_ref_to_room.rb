class AddBed2RefToRoom < ActiveRecord::Migration[5.2]
  def change
  	add_reference :rooms, :bed2, index: true
  end
end

class AddColumnToRoom2AndBed < ActiveRecord::Migration[5.2]
  def change
  	add_column :beds, :date_et_id, :string, array: true, default: [] 
  	add_column :room2s, :date_et_id, :string, array: true, default: [] 	
  end
end
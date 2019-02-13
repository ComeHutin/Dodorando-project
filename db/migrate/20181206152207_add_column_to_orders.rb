class AddColumnToOrders < ActiveRecord::Migration[5.2]
  def change
	  add_column :paniers, :date, :string  
  end
end

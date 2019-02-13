class AddColumnToBed < ActiveRecord::Migration[5.2]
  def change
  	add_column :beds, :date_full, :datetime
  end
end

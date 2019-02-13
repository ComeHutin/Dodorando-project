class AddDateOutToPanier < ActiveRecord::Migration[5.2]
  def change
    add_column :paniers, :date_out, :string
  end
end

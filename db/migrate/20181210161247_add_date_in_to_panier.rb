class AddDateInToPanier < ActiveRecord::Migration[5.2]
  def change
    add_column :paniers, :date_in, :string
  end
end

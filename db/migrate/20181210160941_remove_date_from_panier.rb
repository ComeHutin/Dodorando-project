class RemoveDateFromPanier < ActiveRecord::Migration[5.2]
  def change
    remove_column :paniers, :date, :string
  end
end

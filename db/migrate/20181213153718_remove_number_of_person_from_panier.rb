class RemoveNumberOfPersonFromPanier < ActiveRecord::Migration[5.2]
  def change
    remove_column :paniers, :number_of_person, :string
  end
end

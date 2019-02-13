class RemoveLetterFromPanier < ActiveRecord::Migration[5.2]
  def change
    remove_column :paniers, :letter
  end
end

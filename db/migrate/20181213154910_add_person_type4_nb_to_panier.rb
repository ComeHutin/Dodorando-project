class AddPersonType4NbToPanier < ActiveRecord::Migration[5.2]
  def change
    add_column :paniers, :person_type4_nb, :string
  end
end

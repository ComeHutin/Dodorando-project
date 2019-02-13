class AddPersonType2NbToPanier < ActiveRecord::Migration[5.2]
  def change
    add_column :paniers, :person_type2_nb, :string
  end
end

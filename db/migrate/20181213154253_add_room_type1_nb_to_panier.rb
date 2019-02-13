class AddRoomType1NbToPanier < ActiveRecord::Migration[5.2]
  def change
    add_column :paniers, :room_type1_nb, :string
  end
end

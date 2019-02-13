class AddRoomType4NbToPanier < ActiveRecord::Migration[5.2]
  def change
    add_column :paniers, :room_type4_nb, :string
  end
end

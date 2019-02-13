class AddRoomType2NbToPanier < ActiveRecord::Migration[5.2]
  def change
    add_column :paniers, :room_type2_nb, :string
  end
end

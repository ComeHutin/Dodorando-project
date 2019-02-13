class AddRoomType3NbToPanier < ActiveRecord::Migration[5.2]
  def change
    add_column :paniers, :room_type3_nb, :string
  end
end

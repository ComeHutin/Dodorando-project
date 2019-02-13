class AddOmniauth < ActiveRecord::Migration[5.2]
  def change
  	## Omniauth
  	add_column :users, :facebook_id, :string
  end
end

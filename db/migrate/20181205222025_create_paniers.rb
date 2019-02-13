class CreatePaniers < ActiveRecord::Migration[5.2]
  def change
    create_table :paniers do |t|
	    t.string :letter
	    t.string :params_id
	    t.string :number_of_person
      	    t.timestamps
    end
  end
end

class ChangeBedsToDormitoyBeds < ActiveRecord::Migration[5.2]
  def self.up
    rename_table :beds, :dormitory_beds
  end

  def self.down
    rename_table :dormitory_beds, :beds
  end
end

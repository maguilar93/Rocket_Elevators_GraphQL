class BuildingDetails < ActiveRecord::Migration[5.2]
  def self.up
    create_table :building_details do |t|
      t.integer :building_id, :null => false
      t.string :info_key, :null => false
      t.string :value, :null => false

      t.timestamps
    end
 end
end

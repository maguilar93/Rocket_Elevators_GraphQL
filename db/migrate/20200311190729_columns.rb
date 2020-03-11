class Columns < ActiveRecord::Migration[5.2]
  def self.up
    create_table :columns do |t|
      t.integer :battery_id, :null => false
      t.string :column_type, :null => false
      t.integer :number_floors, :null => false
      t.string :status, :null => false
      t.text :info
      t.text :notes

      t.timestamps
    end
 end
end

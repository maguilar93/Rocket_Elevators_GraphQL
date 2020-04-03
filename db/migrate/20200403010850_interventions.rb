class Interventions < ActiveRecord::Migration[5.2]
  def change
    create_table :interventions do |t|
      t.string :address, :null => false
      t.date :start_of_intervention, :null => false
      t.date :end_of_intervention, :null => false
      t.integer :employee_id, :null => false
      t.integer :building_id, :null => false
      t.integer :battery_id, :null => false
      t.integer :column_id, :null => false
      t.integer :elevator_id, :null => false
      t.string :result, :null => false
      t.string :report, :null => false
      t.string :status, :null => false
      




      t.timestamps
    end
  end
end

class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :full_name
      t.string :phone
      t.string :email
      t.string :SIN
      t.string :insurer
      t.string :insurance_type
      t.integer :vacancy_days_left
      t.string :YTD_hour
      t.string :YTD

      t.timestamps
    end
  end
end

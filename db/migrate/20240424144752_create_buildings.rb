class CreateBuildings < ActiveRecord::Migration[7.1]
  def change
    create_table :buildings do |t|
      t.string :name
      t.decimal :budget
      t.decimal :total_expenditure

      t.timestamps
    end
  end
end

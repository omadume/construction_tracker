class AddDefaultToTotalExpenditure < ActiveRecord::Migration[7.1]
  def change
    change_column :buildings, :total_expenditure, :decimal, default: 0.0
  end
end

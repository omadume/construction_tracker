class CreateDailySnapshots < ActiveRecord::Migration[7.1]
  def change
    create_table :daily_snapshots do |t|
      t.references :building, null: false, foreign_key: true
      t.date :date
      t.decimal :total_expenditure

      t.timestamps
    end
  end
end

class AddBuildingNameToDailySnapshots < ActiveRecord::Migration[7.1]
  def change
    add_column :daily_snapshots, :building_name, :string
  end
end

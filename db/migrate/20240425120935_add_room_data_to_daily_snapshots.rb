class AddRoomDataToDailySnapshots < ActiveRecord::Migration[7.1]
  def change
    add_column :daily_snapshots, :room_data, :text
  end
end

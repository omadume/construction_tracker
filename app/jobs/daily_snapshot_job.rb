class DailySnapshotJob < ApplicationJob
  queue_as :default

  def perform
    Building.find_each do |building|
      room_data = building.rooms&.select(:name, :status).as_json
      building.daily_snapshots.create!(
        date: Date.today,
        building_name: building.name,
        total_expenditure: building.total_expenditure,
        room_data: room_data
      )
    end
  end
end

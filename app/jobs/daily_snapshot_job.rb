class DailySnapshotJob < ApplicationJob
  queue_as :default

  def perform
    Building.find_each do |building|
      create_snapshot(building)
    end
  end

  def create_snapshot(building)
    room_data = building.rooms&.select(:name, :status).as_json
    building.daily_snapshots.create!(
      date: Date.today,
      building_name: building.name,
      total_expenditure: building.total_expenditure,
      room_data: room_data
    )
  rescue ActiveRecord::RecordInvalid => e
    Rails.logger.error "Failed to create daily snapshot for building '#{building.name}': #{e.message}" # Using a logger error instead of throwing json error as it's a background job
  end
end

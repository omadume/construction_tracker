namespace :snapshot do
  desc "Generate daily snapshots of building expenditures, including room details"
  task create_daily_snapshot: :environment do
    Building.find_each do |building|
      room_data = building.rooms.select(:name, :status).as_json
      building.daily_snapshots.create!(
        date: Date.today,
        total_expenditure: total_expenditure,
        room_data: room_data
      )
    end
  end
end

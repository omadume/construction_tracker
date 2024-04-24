json.extract! daily_snapshot, :id, :building_id, :date, :total_expenditure, :created_at, :updated_at
json.url daily_snapshot_url(daily_snapshot, format: :json)

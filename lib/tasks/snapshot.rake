# If I opt to use a tool like Whenever gem or Sidekiq, I can manage the daily_snapshot_job via this rake task instead of in the controller as currently doing

namespace :snapshot do
  desc "Generate daily snapshots of building expenditures, including room details"
  task create_daily_snapshot: :environment do
    DailySnapshotJob.perform_later # Start worker process using: bin/delayed_job start
  end
end

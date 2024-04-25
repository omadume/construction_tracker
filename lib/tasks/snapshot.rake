namespace :snapshot do
  desc "Generate daily snapshots of building expenditures, including room details"
  task create_daily_snapshot: :environment do
    DailySnapshotJob.perform_later # Start worker process using: bin/delayed_job start
  end
end

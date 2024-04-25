require 'clockwork'
require './config/boot'
require './config/environment'

# Run this process when starting app server, use: clockwork config/clock.rb

module Clockwork
  every(1.day, 'daily_snapshot_job', at: '00:00') do
    DailySnapshotJob.perform_later # Using perform_later instead of perform_now for scalability, but means all building snapshots may not be at exactly midnight in the case of large data
  end
end

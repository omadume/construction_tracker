class DailySnapshot < ApplicationRecord
  belongs_to :building
  serialize :room_data, JSON
end
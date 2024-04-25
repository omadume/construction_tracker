class DailySnapshot < ApplicationRecord
  belongs_to :building
  validates_presence_of :date, :total_expenditure, :room_data, :building_id
  serialize :room_data, JSON
end
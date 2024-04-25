class DailySnapshot < ApplicationRecord
  belongs_to :building
  validates_presence_of :date, :building_name, :total_expenditure, :building_id
  serialize :room_data, JSON
end
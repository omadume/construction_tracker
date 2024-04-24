class Building < ApplicationRecord
  has_many :rooms, dependent: :destroy
  has_many :daily_snapshots, dependent: :destroy
end
class Building < ApplicationRecord
  has_many :rooms, dependent: :destroy
  has_many :daily_snapshots, dependent: :destroy
  validates_presence_of :name, :budget, :total_expenditure

  before_save :check_budget

  private
    def check_budget
      if total_expenditure > budget
        errors.add(:total_expenditure, "Cannot exceed budget")
        throw(:abort)
      end
    end
end
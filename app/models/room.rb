class Room < ApplicationRecord
  belongs_to :building
  has_many :elements, dependent: :destroy
  validates_presence_of :name, :cost, :status, :building_id

  enum status: { not_started: "not started", in_progress: "in progress", completed: "completed" }

  after_save :update_status, :update_building_expenditure

  private
    def update_status
      if elements.empty?
        not_started!
      elsif status != "completed" # Assumption that 'completed' will be updated manually via room.update
        in_progress!
      end
    end

    def update_building_expenditure
      building.update!(total_expenditure: total_expenditure + cost)
    end
end
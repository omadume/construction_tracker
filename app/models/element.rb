class Element < ApplicationRecord
  belongs_to :room, optional: true

  after_save :update_room_and_building

  private
    def update_room_and_building
      if room.present?
        room.update_status
        room.building.update(total_expenditure: room.building.total_expenditure + cost)
      end
    end
end
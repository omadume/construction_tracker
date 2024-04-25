class Element < ApplicationRecord
  belongs_to :room, optional: true
  validates_presence_of :name, :cost

  after_save :update_room_and_building

  private
    def update_room_and_building
      if room.present?
        room.update!(status: "in progress", cost: room.cost + cost) # Building expenditure is updated through room after_save
      end
    end
end
class Room < ApplicationRecord
  belongs_to :building
  has_many :elements, dependent: :destroy
end
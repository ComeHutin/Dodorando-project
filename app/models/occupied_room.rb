class OccupiedRoom < ApplicationRecord
  belongs_to :booking
  belongs_to :free_room
  has_many :hosteds
end

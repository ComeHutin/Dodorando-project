class Booking < ApplicationRecord
  belongs_to :order
  has_many :occupied_room
end

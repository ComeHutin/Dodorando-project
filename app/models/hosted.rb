class Hosted < ApplicationRecord
  belongs_to :user
  belongs_to :occupied_room
end

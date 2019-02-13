class House < ApplicationRecord
	has_many :dormitory_rooms #dortoir
	has_many :sleeping_rooms #chambre
	has_many :free_rooms
	belongs_to :city
end

class DormitoryRoom < ApplicationRecord
	has_many :dormitory_beds
	belongs_to :house
end

#Room for dortoire
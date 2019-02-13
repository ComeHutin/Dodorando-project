class Order < ApplicationRecord
  belongs_to :user
  has_many :bookings
  
  enum status: [:in_progress, :confirmed]
end

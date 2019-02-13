class FreeRoom < ApplicationRecord
  belongs_to :room_type
  belongs_to :house
  has_many :occupied_room

  enum status: [:free, :occupied]

  def to_s
    attributes.each_with_object("") do |attribute, result|
      result << "#{attribute[1].to_s}"
    end
  end

end

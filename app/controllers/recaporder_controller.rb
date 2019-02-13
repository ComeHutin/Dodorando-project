class RecaporderController < ApplicationController
  def index
	  if current_user
	    @order = Order.where(user_id: current_user.id).last
	  end
	  @number_of_bed = number_of_person(@order)
	  @date = date(@order)
	  @total_price = @order.total_price 
  end

  private

  def number_of_person(order)
    count = 0
    count = order.bookings.first.occupied_room.count
    return count
  end

  def date(order)
    date = Array.new
    booking = order.bookings.first
    date << booking.check_in
    date << booking.check_out
    return date
  end

  def total_price(order)
    total_price = 0
    x = 0    
    order.bookings.each do |booking|
      x = x + 1	    
      booking.occupied_room.each do |occroom|
        price_of_a_room = FreeRoom.find(occroom.free_room_id).price_of_the_night
	      total_price = total_price + price_of_a_room
      end
    end
    return total_price * x       	      
  end
end

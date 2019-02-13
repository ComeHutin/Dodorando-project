class OrdersController < ApplicationController
  before_action :take_panier

  before_action :authenticate_user!, only: [:order_validation]

  def index
    @panier = Panier.last
    @house = House.find(@panier.params_id.to_i)
    @occupied_beds = number_of_beds_taken(@panier)
    @number_of_person = number_of_persons(@panier)
    @price = price(@house, @panier)
  end

  def create
    panier = take_panier
    number_of_person = number_of_persons(panier)
    order_validation(panier, number_of_person)
  end

  private
  #Save the Panier to use it later
  def take_panier
	  session[:panier] = Panier.last
	  return session[:panier]
  end

  def order_validation(panier, number_people)
     x = 0
     a = 0
     b = 0
     c = 0
     d = 0

     if current_user
      house = House.find(panier.params_id)
      total_price = price(house, panier)
      order = Order.create(user_id: current_user.id, status: "in_progress", total_price: total_price)
      if order.user_id == nil
        order.user_id = current_user.id
      end
      #Create a booking for every person
      number_people.times do
        booking = Booking.create(check_in: panier.date_in, check_out: panier.date_out, order_id: order.id)
        if x < 1
            house.free_rooms.each do |room|
	      if room.room_type_id == 1 && a < panier.room_type1_nb.to_i
	         if reservation_lock(panier, room, booking) == 1
			 a = a + 1
		 end
	      elsif room.room_type_id == 2 && b < panier.room_type2_nb.to_i
		 if reservation_lock(panier, room, booking) == 1
			 b = b + 1
		 end
	      elsif room.room_type_id == 3 && c < panier.room_type3_nb.to_i
		 if reservation_lock(panier, room, booking) == 1
			 c = c + 1
		 end
	      elsif room.room_type_id == 4 && d < panier.room_type4_nb.to_i
		 if reservation_lock(panier, room, booking) == 1
			 d = d + 1
		 end
	      end
	    end
	end
	x = x + 1
      end
       redirect_to '/recaporder'
     else
       redirect_to '/users/sign_in'
     end
  end

  def number_of_beds_taken(panier)
    number_of_bed = 0
    number_of_bed = panier.room_type1_nb.to_i + panier.room_type2_nb.to_i + panier.room_type3_nb.to_i + panier.room_type4_nb.to_i
    return number_of_bed

  end

  def number_of_persons(panier)
	  number_of_persons = 0
	  number_of_persons = panier.room_type1_nb.to_i + panier.person_type2_nb.to_i + panier.room_type3_nb.to_i + panier.person_type4_nb.to_i 
	  return number_of_persons
  end

  def price(house, panier)
    x = 0
    y = 0
    w = 0
    a = 0
    price = 0

    house.free_rooms.each do |room|
      if x < 1 && room.room_type_id == 1
        price = price + room.price_of_the_night*panier.room_type1_nb.to_i
	x = x + 1
      elsif y < 1 && room.room_type_id == 2
	 price = price + room.price_of_the_night*panier.person_type2_nb.to_i
	 y = y + 1
      elsif w < 1 && room.room_type_id == 3
	 price = price + room.price_of_the_night*panier.room_type3_nb.to_i
	 w = w + 1
      elsif a < 1 && room.room_type_id == 4
	 price = price + room.price_of_the_night*panier.person_type4_nb.to_i
         a = a + 1
      end
    end
    return price   
  end

  def reservation_lock(panier, free_room, booking)
     counter = 0
     #Check if there is  an Occupied room in the date chosen
     OccupiedRoom.where("free_room_id = #{free_room.id}").each do |occuped|
       booking1 = Booking.find(occuped.booking_id.to_i)
       # if Order id is the same as the Occupied Room, it mean that, it is a booking from the same person.
       if booking1.check_in.to_s == panier.date_in.to_s
          counter = 1
       end
     end
     #Create an occupied room, if counter = 0, it mean that the room is free for this date
     if counter == 0
       occupied_room = OccupiedRoom.create(booking_id: booking.id, free_room_id: free_room.id)
       Hosted.create(user_id: current_user.id, occupied_room_id: occupied_room.id)
       return 1
     else
       return 0
     end
  end
end

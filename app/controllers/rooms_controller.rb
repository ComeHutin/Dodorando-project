class RoomsController < ApplicationController
  protect_from_forgery prepend: true
  protect_from_forgery with: :null_session


  @@params_id = nil

  def show
	  @@params_id = params[:id]
	  @room = DormitoryRoom.find(params[:id].to_i)
	  @number_of_bed = @room.number_of_beds
    @room_id_test = @@params_id
  end

  def create

	  Panier.create(date_in: params[:date], date_out: params[:date1], params_id: params[:house_id], room_type1_nb: params[:quantity],room_type2_nb: params[:double_bed_nb], room_type3_nb: params[:simple_bed_nb], room_type4_nb: params[:simples_beds_nb], person_type2_nb: params[:double_bed_person], person_type4_nb: params[:simple_beds_persons])
  	  redirect_to '/orders'
  end
end

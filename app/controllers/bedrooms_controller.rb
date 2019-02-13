class BedroomsController < ApplicationController
  protect_from_forgery prepend: true
  protect_from_forgery with: :null_session


  @@params = nil

  def show
	  @@params_id = params[:id]
	  @bedroom = DormitoryRoom.find(params[:id].to_i)
    @u = params[:id]
    puts session[:date]
  end

  def create
	  Panier.create(letter: 'b', params_id: @@params_id, number_of_person: params[:quantity])
  
    redirect_to '/orders'
  end
  
  private


end

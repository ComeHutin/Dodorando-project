class Available
  
  def initialize (room_id, date, options={}) #pour indiquer l'id du bed (5 par exemple) pour la date X, et le room_id Y, il faut rentrer : 
  	# example = Available.new(Y, X, :bed_id => 5)
  	@room_id = room_id
  	@date = date
  end

  def room_available
    @room = Room.find_by(room_id: '@room_id')
    if (@room.empty_full != 1)
      @id_bed = bed_id.value
      @dispo = Bed.find_by(bed_id: '@id_bed').date_full.all
      @dispo.each do |k|
        if (k == @date)
      	  return 1
        else
        end
      end
      return 0
    else
      return 1
    end
  end

  def room2_available 
    @room2 = Room2.find_by(room2_id: '@room_id')
    @dispo = @room2.date_full.all 
    @dispo.each do |k|
      if (k == @date)
    	return 1
      else
      end
    end
    return 0
  end

end
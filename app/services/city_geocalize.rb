
require 'geocoder'

class CityGeocalize
 
  def initialize(city)
    @city = city	
  end

  def perform
    geocalize
  end

  private

  def geocalize
  	results = Geocoder.search(@city)
  	return results.first.coordinates
  end
end
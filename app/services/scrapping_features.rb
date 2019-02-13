require 'nokogiri'
require 'open-uri'
require 'csv'

class ScrappingFeatures

  def perform
  	get_url
  	scrap
  end

  def get_url
      page = Nokogiri::HTML(open("http://chemindecompostelle.com/Selection/CarteFrance.html"))
  u = page.xpath("/html/body/div/table[1]/tr/td/p/map/area[58]").map{ |link| link['href'] }
  k = u[0]
  j = "http://chemindecompostelle.com/Selection/" + "#{k}"
  
  puts j
  end

  def scrap
    page = Nokogiri::HTML(open(""))
  end

end
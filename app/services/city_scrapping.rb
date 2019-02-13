require 'nokogiri'
require 'open-uri'
require 'csv'


class CityScrapping

   def perform
     scrapper
   end

  def scrapper
    page = Nokogiri::HTML(open("http://www.chemin-compostelle.info/france/puy-en-velay-gr65-compostelle.php"))

    i = 3
    j = 33
    k = 0
    @result = Array.new
    while (i < j)
      @nom_ville_depart = page.xpath("/html/body/div[1]/div[1]/div[2]/div[3]/table/tr[#{i}]/td[2]")
      @nom_ville_darrivee = page.xpath("/html/body/div[1]/div[1]/div[2]/div[3]/table/tr[#{i}]/td[3]")
      @nombre_de_km_depuis_velay = page.xpath("/html/body/div[1]/div[1]/div[2]/div[3]/table/tr[#{i}]/td[5]")

      @result[k] = @nom_ville_depart.text
      k = k + 1
      @result[k] = @nom_ville_darrivee.text
      k = k + 1
      @result[k] = @nombre_de_km_depuis_velay.text
      i = i + 1
      k = k + 1
    end

    i = 0
    @result.each do |l|
      CSV.open("db.csv", "wb") do |csv|
        csv << ["tableau(ville de départ/ville d'arrivée/nombre de km total parcourus)"]
        csv << ["#{@result}"]
      end
    end
  end
end

require 'nokogiri'
require 'open-uri'
require 'csv'

def perform
  page = Nokogiri::HTML(open("http://chemindecompostelle.com/Selection/CarteFrance.html"))
  u = page.xpath("/html/body/div/table[1]/tr/td/p/map/area[58]").map{ |link| link['href'] }
  k = u[0]
  j = "http://chemindecompostelle.com/Selection/" + "#{k}"
  l = j.slice(0..-8)
  m = ".html"
  n = 0
  h = 1
  g = 0
  result = Array.new(25)

  while (h < 26)
    if (h < 10)
    	q = "#{l}" + "0" + "#{h}" + "#{m}"
    else
    	q = "#{l}" + "#{h}" + "#{m}"
    end
    h = h + 1
    result[g] = q
    g = g + 1
  end
  a = 0
  tab = Array.new(25)
  result.each do |x|
  	b = 1
  	page = Nokogiri::HTML(open("#{x}"))
  	tab[a] = Array.new(21)
  	if (a < 3)
    while (b < 21)
        z = page.xpath("/html/body/div/table/tr/td/map/area[#{b}]").map{ |link| link['href'] }
        y = z[0]
        y = y.to_s
        y = y.slice(2..-1)
    	tab[a][b] = "chemindecompostelle.com" + "#{y}"
    	b = b + 1
    end 
    else
    	while (b < 21)
        z = page.xpath("/html/body/div/table/tr/td/map/area[#{b}]").map{ |link| link['href'] }
        y = z[0]
        y = y.to_s
        y = y.slice(2..-1)
    	tab[a][b] = "chemindecompostelle.com" + "#{y}"
        b = b + 1
    end 

    end 
      a = a + 1
  end
  final = Array.new(25)
  i = 0
  tab.each do |v|
    v.each do |t|
      if (t.to_s.start_with?("chemindecompostelle.com/") == true)
        final[i] = "http://" + "#{t}"
        i = i + 1
      end
    end
  end
  scrap = Array.new(100)
  i = 0
  final.each do |x|
  	scrap[i] = Array.new(7)
    begin
      page = Nokogiri::HTML(open("#{x}"))
      scrap[i][0] = page.xpath("/html/body/div/table/tr[2]/td[2]/table/tr[2]/td/table/tr[2]/td[2]/font").text
      scrap[i][1] = page.xpath("/html/body/div/table/tr[2]/td[2]/table/tr[3]/td/table/tr[2]/td[2]/font").text
      #scrap[i][2] = page.xpath("/html/body/div/table/tr[2]/td[2]/table/tr[9]/td/table/tr[2]/td[1]/div/table/tr[1]").text
      #scrap[i][3] = page.xpath("/html/body/div/table/tr[2]/td[2]/table/tr[9]/td/table/tr[2]/td[1]/div/table/tr[2]").text
      #scrap[i][4] = page.xpath("/html/body/div/table/tr[2]/td[2]/table/tr[9]/td/table/tr[2]/td[1]/div/table/tr[3]").text
      #scrap[i][5] = page.xpath("/html/body/div/table/tr[2]/td[2]/table/tr[9]/td/table/tr[2]/td[1]/div/table/tr[4]").text
      #scrap[i][6] = page.xpath("/html/body/div/table/tr[2]/td[2]/table/tr[9]/td/table/tr[2]/td[1]/div/table/tr[5]").text
    rescue
      p "Erreur 404"
    end
  i = i + 1
  end
  CSV.open("./db.csv", "wb") do |csv|
  	scrap.each do |x|
  		x.each do |v|
  		  v = v.to_s
  	      v = v.delete "\\t","\\n"
  	      v = v.delete "	"
  	      v = v.delete "\\r"
  	      if (v != "")
  	        csv << [v]
  	      end
  	    end
    end
  end
end

perform

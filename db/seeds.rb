# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'début du seed'


city_01 = City.create(name: 'Espalion', place: '1', distance_next: '25')
city_02 = City.create(name: 'Saugues', place: '2', distance_next: '34')
#city_03 = City.create(name: 'Nasbinals', place: '3', distance_next: '45')


## Room_type id 1
bed_in_dormitory_room = RoomType.create(description: 'lit dans un dortoir',capacity: 1 )
## Room_type id 2
bed_in_a_private_room_01 = RoomType.create(description: 'chambre double',	capacity: 2 )
## Room_type id 3
bed_in_a_private_room_02 = RoomType.create(description: 'chambre lit simpe', capacity: 1 )
##Room_type id 4
bed_in_a_private_room_03 = RoomType.create(description: 'chambre avec 2 lits simple', capacity: 2 )

espalion_01 = House.create(city_id: 1, 
                         name: 'Gîte du Pont Vieux',
                         number_of_dormitory_rooms: 3,
                         number_of_rooms: 0,
                         empty_full: 0,
                         description:'Situé au cœur de la vieille ville d\'Espalion avec vue sur le Lot, à 50 mètres du Pont Vieux et du Vieux Palais, le gîte du PONT VIEUX (anciennement OBRADOR ) ouvert toute l\'année, vous propose dans un cadre et une ambiance chaleureuse un hébergement de qualité à taille humaine, au travers de 3 chambres de 4 lits pour une capacité totale de 12 personnes.',
                           )                       
espalion_02 = House.create(city_id: 1, 
                         name: 'La Halte Saint Jacques', 
                         description: 'la Halte Sant jacques est située en plein centre-ville d\'Espalion, dans une petite rue calme, à deux pas du magnifique pont médiéval',
                         number_of_rooms: 0,
                         number_of_dormitory_rooms: 4,
                           empty_full: 0)
espalion_03 = House.create(city_id: 1, 
                         name: 'Aux Portes des Monts d\'Aubrac', 
                         description:'Le domaine se situe à 1 km du centre ville d’Espalion sur le GR 65 en direction d’Estaing. Au cœur d’un parc de 6 hectares à la campagne, au calme pour ceux qui recherchent le repos et la sérénité.Le village vacances se compose de 42 pavillons de plain pied pouvant accueillir de 2 à 7 personnes : Studio 2 personnes environ 23 m2, Logement 2 pièces 5/6 personnes environ 33 m2, Logement 3 pièces 7 personnes environ 42 m2, tous avec coin cuisine entièrement équipé, terrasse de plain-pied avec mobilier de jardin',
                         number_of_rooms: 42,
                         number_of_dormitory_rooms: 0,
                           empty_full: 0)
espalion_04 = House.create(city_id: 1, 
                         name: 'Gîte d\'étape Au Fil de l\'Eau', 
                         description: 'Aux portes de l’Aubrac au cœur de la vallée du Lot, le gîte de 20 places se situe au centre d’Espalion près du Vieux Palais (site classé), des commerces, services, restaurants et à coté de l’office du tourisme. Nous vous accueillerons d’avril à octobre tous les jours sur votre parcours du chemin de Compostelle, au bord du Lot et de son espace pique-nique pour les soirées d’été. Profitez de ces 5 chambres de 4 lits avec toutes leur salle d’eau et wc indépendants. Reposez vous dans sa pièce de vie conviviale avec sa cuisine ouverte ou vous pouvez aussi préparer vos repas du soir. Mireille, Pèlerine et ancienne accompagnatrice de montagne, se fera une joie d’échanger avec vous, son expérience du chemin de Saint Jacques et de la randonnée.',
                         number_of_rooms: 0,
                         number_of_dormitory_rooms: 5,
                           empty_full: 0)
espalion_05 = House.create(city_id: 1, 
                         name: 'Relais de Boralde', 
                         description: 'Au coeur de la vallée du Lot et au pied des Monts d\'Aubrac. A 3 km de Saint-Côme-d\'Olt et 2 km d\'Espalion. Hôtel-restaurant de 15 chambres, avec jardin et parc sur les bords de la Boralde et du Lot. Etablissement familial qui a tout d\'une Auberge de campagne.',
                         number_of_rooms: 15,
                         number_of_dormitory_rooms: 0,
                           empty_full: 0)

saugues_01 = House.create(city_id: 2, name: 'Le repos du Pèlerin', number_of_dormitory_rooms: 1, number_of_rooms: 4, description: 'Le repos du pelerin vous accueille de mars à novembre sur le chemin de Saint Jacques de Compostelle au cœur des gorges de l\'Allier. Nous vous proposons 5 chambres d\'hôtes et une chambre à partager d\'une capacité de 9 personnes avec vue sur l\'Allier. Vous pourrez également deguster dans notre restaurant d\'une capacité de 40 personnes une cuisine élaborée avec des produits frais locaux et de saison. Pourquoi ne pas profiter de votre séjour pour pratiquer les sports d eaux vives (rafting, canyoning) ou encore découvrir les gorges de l\'Allier en train. Sans oublier les églises, la légende de la bête du gevaudan et les activités natures telles la randonnee, le vélo rail, la baignade et le site d\'escalade de Monistrol d\'Allier.') 


x = 1
while x < 10
  beds_saugues = FreeRoom.new(number_of_the_room: x, name_of_the_room: bed_in_dormitory_room.description ,status: "free", room_type_id: 1, price_of_the_night: 33.50)
  city = City.find_by(name: 'Saugues')
  house = House.where(city_id: city.id).first
  beds_saugues.house_id = house.id
  beds_saugues.save
  puts beds_saugues.inspect
  x = x + 1
end

x = 1
while x < 2
  beds_double_saugues = FreeRoom.create(house_id: 2, number_of_the_room: x, name_of_the_room: bed_in_a_private_room_01.description, status: "free", room_type_id: 2, price_of_the_night: 82)
  city = City.find_by(name: 'Saugues')
  house = House.where(city_id: city.id).first
  beds_double_saugues.house_id = house.id
  beds_double_saugues.save
  puts beds_double_saugues.inspect
  x = x + 1
end

x = 1
while x < 2
  beds_simple_saugues = FreeRoom.create(house_id: 2, number_of_the_room: x, name_of_the_room: bed_in_a_private_room_02.description, status: "free", room_type_id: 3, price_of_the_night: 50)
  city = City.find_by(name: 'Saugues')
  house = House.where(city_id: city.id).first
  beds_simple_saugues.house_id = house.id
  beds_simple_saugues.save
  puts beds_simple_saugues.inspect
  x = x + 1
end

x = 1
beds_simple1_saugues = FreeRoom.create(house_id: 2, number_of_the_room: x, name_of_the_room: bed_in_a_private_room_03.description, status: "free", room_type_id: 4, price_of_the_night: 82)
  city = City.find_by(name: 'Saugues')
  house = House.where(city_id: city.id).first
  beds_simple1_saugues.house_id = house.id
  beds_simple1_saugues.save


y = 1
while y <12
  beds_01_espalion_01 = FreeRoom.new(number_of_the_room: y,
                                      name_of_the_room: "lit dortoir #{y}",
                                      status: 'free',
                                      room_type_id: 1,
                                      price_of_the_night: 17,)
  city = City.find_by(name: 'Espalion')
  house = House.where(city_id: city.id).first
  beds_01_espalion_01.house_id = house.id
  beds_01_espalion_01.save
  puts beds_01_espalion_01.inspect
  y += 1
end

puts 'Ok seed terminé'

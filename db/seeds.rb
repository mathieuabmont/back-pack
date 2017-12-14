
Ticket.destroy_all
Transport.destroy_all
Activity.destroy_all
Accommodation.destroy_all
Step.destroy_all
Trip.destroy_all
User.destroy_all




p "creating users"

user_mathieu = User.new(first_name: 'mathieu', last_name: 'Markle',  password: "password", email: 'mathieu@mail.com' )
user_mathieu.remote_photo_url = "http://res.cloudinary.com/alumni/image/upload/v1513099452/jlqrybv4d7dsbgdpjww3.jpg"
user_mathieu.save!

p "users - done"


p "creating a trip"http://res.cloudinary.com/alumni/image/upload/v1513099452/jlqrybv4d7dsbgdpjww3.jpg
trip_mathieu = Trip.new(title: "Chili")
trip_mathieu.remote_photo_url = "http://res.cloudinary.com/alumni/image/upload/v1513260887/chili_db2rqw.jpg"
trip_mathieu.save!
p "trip - done"

p "creating lien entre user et trip"
itinerary_mathieu = Itinerary.new(trip: trip_mathieu, user: user_mathieu)
itinerary_mathieu.save!
p"itineray done"


p "creating 2 steps"
step_1_mathieu = Step.new(title: "Santiago", trip: trip_mathieu)
step_1_mathieu.remote_photo_url = "http://res.cloudinary.com/alumni/image/upload/v1513251957/step2-Santiago_kmzewe.jpg"
step_1_mathieu.save!
step_2_mathieu = Step.new(title: "Calama", trip: trip_mathieu )
step_2_mathieu.remote_photo_url = "http://res.cloudinary.com/alumni/image/upload/v1513251954/Step-1ville_1-calama_xqisdr.jpg"
step_2_mathieu.save!
p "2 steps - done"

date_departure_step1 = Date.new(2017,16,12)
date_departure_hotel = Date.new(2017,18,12)

p "creating 1 transport pour Santiago"
transport_1_Santiago = Transport.new(departure_date: date_departure_step1, departure_location: "Paris", departure_time: "15h12", arrival_location: "Calama", arrival_date: date_departure_step1, arrival_time: "21H12", step: step_1_mathieu )
transport_1_Santiago.save!
p "1 transport - done"


p "creating 1 ticket pour Santiago"
ticket_1_Santiago = Ticket.new(transport: transport_1_Santiago, user: user_mathieu)
ticket_1_Santiago.remote_photo_url = "http://res.cloudinary.com/alumni/image/upload/v1513261744/billet_avion_PAris_santiago_vq3kx8.png"
ticket_1_Santiago.save!
p "1 ticket - done"



 p "creating 2 activities pour Santiago"
 activity_1_Santiago = Activity.new(title: "Balade à vélo", url:"https://labicicletaverde.com/", step: step_1_mathieu)
 activity_1_Santiago.remote_photo_url = "http://res.cloudinary.com/alumni/image/upload/v1513251962/Step2-activity_2-_bike_ifrt5z.jpg"
 activity_1_Santiago.save!
 activity_2_Santiago = Activity.new(title: "Degustation de vins", url:"http://www.casasdelbosque.cl/english/vina/vina.php",step: step_1_mathieu )
 activity_2_Santiago.remote_photo_url = "http://res.cloudinary.com/alumni/image/upload/v1513251956/step2-activity_2-_wine_jqhmmz.jpg"
 activity_2_lyon.save!
 p "2 activities - done"


 p "creating 2 activities pour Calama"

 activity_1_Calama = Activity.new(title: "Salar de Tara", url:"https://www.chauxmelemonde.com/salar-de-tara-chili/", step: step_2_mathieu)
 activity_1_Calama.remote_photo_url = "http://res.cloudinary.com/alumni/image/upload/v1513251963/Activite%CC%81-1-salar-de-tara_uulsje.jpg"
 activity_1_Calama.save!
 activity_2_Calama = Activity.new(title: "Trekking Machucha", url:"http://eldesiertoflorido.over-blog.com/2016/09/site-touristique-trekking-machuca-rio-grande.html", step: step_2_mathieu)
 activity_2_Calama.remote_photo_url = "http://res.cloudinary.com/alumni/image/upload/v1513251958/step1-activity2-trek_khy5m6.jpg"
 activity_2_Calama.save!
 p "2 activities - done"



 p "creating 1 logement pour Santiago"
 accommodation_Santiago = Accommodation.new(category: "Hotel", name: "Atton el Bosque", url: "https://www.atton.com/el-bosque", location: "Roger de Flor 2770, Las Condes", arrival_date: date_departure_step1, departure_date: date_departure_hotel, step: step_1_mathieu )
 accommodation_Santiago.remote_photo_url = "http://res.cloudinary.com/alumni/image/upload/v1513262773/Hotel_santiago_jwp4yi.jpg"
 accommodation_Santiago.save!
 p "1 logement - done"



 p "creating 1 logement pour Calama"
 accommodation_Calama = Accommodation.new(category: "Hotel", name: "Atton el Bosque", url: "https://www.atton.com/el-bosque", location: "Roger de Flor 2770, Las Condes", arrival_date: date_departure_step1, departure_date: date_departure_hotel, photo: "", step: step_2_mathieu )
 accommodation_Calama.save!
 p "1 logement - done"




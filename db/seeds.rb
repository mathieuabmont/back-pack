Invitation.destroy_all
Ticket.destroy_all
Transport.destroy_all
Activity.destroy_all
Accommodation.destroy_all
Step.destroy_all
Trip.destroy_all
User.destroy_all




p "creating users"

user_mathieu = User.new(first_name: 'Mathieu', last_name: 'Abmont',  password: "password", email: 'mathieu.abmont@gmail.com' )
user_mathieu.remote_photo_url = "http://res.cloudinary.com/alumni/image/upload/v1513099452/jlqrybv4d7dsbgdpjww3.jpg"
user_mathieu.save!

p "users - done"


p "creating a trip"
trip_mathieu_before = Trip.new(title: "Zimbabwe", photo: "http://res.cloudinary.com/alumni/image/upload/q_auto:low/v1513265533/ZIMBABWE_shl3wa.jpg")
trip_mathieu_before.save!
trip_mathieu = Trip.new(title: "Chili", photo: "http://res.cloudinary.com/alumni/image/upload/q_auto:low/v1513260887/chili_db2rqw.jpg")
trip_mathieu.save!
p "trip - done"

p "creating lien entre user et trip"
itinerary_mathieu_before = Itinerary.new(trip: trip_mathieu_before, user: user_mathieu)
itinerary_mathieu_before.save!

itinerary_mathieu = Itinerary.new(trip: trip_mathieu, user: user_mathieu)
itinerary_mathieu.save!
p"itineray done"


p "creating 3 steps"
step_1_mathieu = Step.new(title: "Santiago", trip: trip_mathieu, photo: "http://res.cloudinary.com/alumni/image/upload/q_auto:low/v1513251957/step2-Santiago_kmzewe.jpg")
step_1_mathieu.save!
step_2_mathieu = Step.new(title: "Calama", trip: trip_mathieu, photo: "http://res.cloudinary.com/alumni/image/upload/q_auto:low/v1513251954/Step-1ville_1-calama_xqisdr.jpg" )
step_2_mathieu.save!
step_3_mathieu = Step.new(title: "Valparaiso", trip: trip_mathieu, photo: "http://res.cloudinary.com/alumni/image/upload/q_auto:low/v1513251958/Step3-valparaiso_l45mtb.jpg" )
step_3_mathieu.save!


p "2 steps - done"

date_departure_step1 = Date.today + 1
date_departure_hotel = Date.today + 5
date_departure_hotel_3 = Date.today + 10
date_departure_hotel_2 = Date.today + 7

p "creating 1 transport pour Santiago"
transport_1_Santiago = Transport.new(departure_date: date_departure_step1, departure_location: "Paris", departure_time: "14H45", arrival_location: "Santiago", arrival_date: date_departure_step1, arrival_time: "21H12", step: step_1_mathieu )
transport_1_Santiago.save!
p "1 transport - done"

p "creating 1 transport pour Calama"
transport_1_Calama = Transport.new(departure_date: date_departure_hotel, departure_location: "Santiago", departure_time: "18H20", arrival_location: "Calama", arrival_date: date_departure_hotel, arrival_time: "23H30", step: step_2_mathieu )
transport_1_Calama.save!
p "1 transport - done"

p "creating 1 ticket pour Santiago"
ticket_1_Santiago = Ticket.new(transport: transport_1_Santiago, user: user_mathieu)
ticket_1_Santiago.remote_photo_url = "http://res.cloudinary.com/alumni/image/upload/q_auto:low/v1513327979/Billet_d_avion_ij6bzd.png"
ticket_1_Santiago.save!
p "1 ticket - done"

p "creating transport for Valparaiso"
transport_3_Valparaiso = Transport.new(departure_date: date_departure_hotel_3, departure_location: "Calama", departure_time: "15h00", arrival_location: "Valparaiso", arrival_date: date_departure_hotel_2, arrival_time: "17H35", step: step_3_mathieu)
transport_3_Valparaiso.save!
p "done"

p "creating 3 activities pour Santiago"
activity_1_Santiago = Activity.new(title: "Balade à vélo, avec Santiago Markets Bike tour", url:"https://labicicletaverde.com/", photo: "http://res.cloudinary.com/alumni/image/upload/q_auto:low/v1513251962/Step2-activity_2-_bike_ifrt5z.jpg", step: step_1_mathieu)
activity_1_Santiago.save!
activity_2_Santiago = Activity.new(title: "Degustation de vins a la Casa del Bosque, gouter le Almaviva", url:"http://www.casasdelbosque.cl/english/vina/vina.php",photo: "http://res.cloudinary.com/alumni/image/upload/q_auto:low/v1513251956/step2-activity_2-_wine_jqhmmz.jpg", step: step_1_mathieu )
activity_2_Santiago.save!
activity_3_Santiago = Activity.new(title: "Fiesta à la Feria la boite electro de Santiago", url:"http://www.casasdelbosque.cl/english/vina/vina.php",photo: "http://res.cloudinary.com/alumni/image/upload/q_auto:low/v1513269187/Santiago-activity-fiesta_qe9iah.jpg", step: step_1_mathieu )
activity_3_Santiago.save!
activity_4_Santiago = Activity.new(title: "Rafting Maipo Canyon Chile, 30 min de voiture", url:"http://www.casasdelbosque.cl/english/vina/vina.php",photo: "http://res.cloudinary.com/alumni/image/upload/q_auto:low/v1513269888/rafting_santiago_activity_cubvit.jpg", step: step_1_mathieu )
activity_4_Santiago.save!
activity_1_Valparaiso = Activity.new(title: "Aller voir Ascensor de Reina Victoria, aller le matin sinon trop de monde", url:"http://www.casasdelbosque.cl/english/vina/vina.php",photo: "http://res.cloudinary.com/alumni/image/upload/q_auto:low/v1513251955/Step3-activity-1-Ascensor-ReinaVictoria_nk2r2z.jpg", step: step_3_mathieu )
activity_1_Valparaiso.save!
p "3 activities - done"


p "creating 2 activities pour Calama"

activity_1_Calama = Activity.new(title: "Visiter le Salar de Tara. Pas oublier appareil photo", url:"https://www.chauxmelemonde.com/salar-de-tara-chili/", photo: "http://res.cloudinary.com/alumni/image/upload/q_auto:low/v1513251963/Activite%CC%81-1-salar-de-tara_uulsje.jpg", step: step_2_mathieu)
activity_1_Calama.save!
activity_2_Calama = Activity.new(title: "Trekking de une journée a Machucha et Rio Grande", url:"http://eldesiertoflorido.over-blog.com/2016/09/site-touristique-trekking-machuca-rio-grande.html", photo: "http://res.cloudinary.com/alumni/image/upload/q_auto:low/v1513251958/step1-activity2-trek_khy5m6.jpg", step: step_2_mathieu)
activity_2_Calama.save!
p "2 activities - done"



p "creating 1 logement pour Santiago"
accommodation_Santiago = Accommodation.new(category: "Airbnb", name: "At Rodrigo's", url: "https://www.airbnb.fr/rooms/3406062", photo: "http://res.cloudinary.com/alumni/image/upload/v1513337195/Flat_santiago_the_one_hjmh6k.jpg", location: "534 Avenida Libertador, Santiago, Las Condes", arrival_date: date_departure_step1, departure_date: date_departure_hotel, description: "Increíble Duplex a nuevo, Mall Costanera Center. Code 43B54", step: step_1_mathieu )
accommodation_Santiago.save!
accommodation_Calama = Accommodation.new(category: "Hotel", name: "Tierra Atacama", url: "http://www.tierrahotels.com/tierra-atacama-hotel-boutique-amp-spa/", photo: "http://res.cloudinary.com/alumni/image/upload/v1513335480/Hotel_calama_zt8ld8.jpg", location: "Calle Séquitor, (San Pedro de Atacama, Chile) ", arrival_date: date_departure_hotel, departure_date: date_departure_hotel_2, description: "Si perdu les joindre au +35 7754 7754 43", step: step_2_mathieu )
accommodation_Calama.save!
p "1 logement - done"







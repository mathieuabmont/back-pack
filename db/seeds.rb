
Ticket.destroy_all
Transport.destroy_all
Activity.destroy_all
Step.destroy_all
Trip.destroy_all
User.destroy_all




p "creating users"

user_rachel = User.new(first_name: 'rachel', last_name: 'Markle',  password: "password", email: 'rachel@gmail.com' )
user_rachel.remote_photo_url = "http://res.cloudinary.com/alumni/image/upload/v1512492401/rachel_ozgdkv.jpg"
user_rachel.save

p "users - done"


p "creating a trip"
trip_rachel = Trip.new(title: "France")
trip_rachel.save!
p "trip - done"

p "creating lien entre user et trip"
itinerary_rachel = Itinerary.new(trip: trip_rachel, user: user_rachel)
itinerary_rachel.save!
p"itineray done"


p "creating 2 steps"
step_1_rachel = Step.new(title: "Lyon", trip: trip_rachel)
step_1_rachel.save!
step_2_rachel = Step.new(title: "Marseille", trip: trip_rachel )
step_2_rachel.save!
p "2 steps - done"



p "creating 1 transport pour Lyon"
transport_1_lyon = Transport.new(departure_date: "2017-27-12", departure_location: "Paris", departure_time: "15h12", arrival_location: "Lyon", arrival_date: "2017-27-12", arrival_time: "19H12", step: step_1_rachel )
transport_1_lyon.save!
p "1 transport - done"


p "creating 1 ticket pour Lyon"
ticket_1_lyon = Ticket.new.remote_photo_url = "http://res.cloudinary.com/alumni/image/upload/v1512726684/billettrain_c76aiz.jpg"
ticket_1_lyon.save!
p "1 ticket - done"



 p "creating 2 activities pour Lyon"
 activity_1_lyon = Activity.new(title: "Vieux lyon", url:"http://www.blog-in-lyon.fr", photo: "http://a401.idata.over-blog.com/600x446/1/83/03/55/album-nature/2-album-nature/4-ALBUM-NATURE/8-a--CATHEDRALE-ST-JEAN-VIEUX-LYON-ET-VUE-BASILIQUE-FOURVIE.jpg", step: step_1_rachel)
 activity_1_lyon.save!
 activity_2_lyon = Activity.new(title: "Basilique Notre Dame", url:"https://lyon.citycrunch.fr", photo: "http://a401.idata.over-blog.com/600x446/1/83/03/55/album-nature/2-album-nature/4-ALBUM-NATURE/8-a--CATHEDRALE-ST-JEAN-VIEUX-LYON-ET-VUE-BASILIQUE-FOURVIE.jpg",step: step_1_rachel )
 activity_2_lyon.save!
 p "2 activities - done"





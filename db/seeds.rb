# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

 Activity.destroy_all
 User.destroy_all
 Step.destroy_all
 Trip.destroy_all


p "creating users"

user_rachel = User.new(first_name: 'rachel', last_name: 'Markle',  password: "password", email: 'rachel@gmail.com' )
user_rachel.remote_photo_url = "http://res.cloudinary.com/alumni/image/upload/v1512492401/rachel_ozgdkv.jpg"
user_rachel.save

p "users - done"


p "creating a trip"
trip_rachel = Trip.new(title: "France")
trip_rachel.save!
p "trip - done"


p "creating 2 steps"
step_1_rachel = Step.new(title: "Lyon", trip: trip_rachel)
step_1_rachel.save!
step_2_rachel = Step.new(title: "Marseille", trip: trip_rachel )
step_2_rachel.save!
p "2 steps - done"


# p "creating 2 activities pour Lyon"
# activity_1_lyon = Activity.new(title: "Vieux lyon", url:"https://www.tripadvisor.fr/Attraction_Review-g187265-d195466-Reviews-Vieux_Lyon-Lyon_Rhone_Auvergne_Rhone_Alpes.html", step: step_1_rachel)
# activity_1_lyon.remote_photo_url = "http://res.cloudinary.com/alumni/image/upload/v1512496157/vieux_lyon_sarcgv.jpg"
# activity_1_lyon.save!
# activity_2_lyon = Activity.new(title: "Basilique Notre Dame", url:"https://www.tripadvisor.fr/Attraction_Review-g187265-d195467-Reviews-Basilique_Notre_Dame_de_Fourviere-Lyon_Rhone_Auvergne_Rhone_Alpes.html", step: step_1_rachel )
# activity_2_lyon.remote_photo_url = "http://res.cloudinary.com/alumni/image/upload/v1512496966/Notre_Dame_de_Fourvi%C3%A8re_ksiyml.jpg"
# activity_2_lyon.save!
# p "2 activities - done"

# p "creating 1 transport pour Lyon"
# transport_1_lyon = Transport.new(title: "Vieux lyon", url:"https://www.tripadvisor.fr/Attraction_Review-g187265-d195466-Reviews-Vieux_Lyon-Lyon_Rhone_Auvergne_Rhone_Alpes.html", step: step_1_rachel)
# activity_1_lyon.remote_photo_url = "http://res.cloudinary.com/alumni/image/upload/v1512496157/vieux_lyon_sarcgv.jpg"
# activity_1_lyon.save!
# p "1 transport - done"



# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
puts "Resetting the seeds with golden unicorns"
User.destroy_all
Bike.destroy_all
Booking.destroy_all

p "Feeding the new users"
# Users
user1 = User.new(email: "first@gmail.com", password: "1234567")
user1.save
user2 = User.new(email: "second@gmail.com", password: "1234567")
user2.save
user3 = User.new(email: "third@gmail.com", password: "1234567")
user3.save
user4 = User.new(email: "fourth@gmail.com", password: "1234567")
user4.save

p "Cooking racers for the rainbow race"
# Bikes
ducati = Bike.new(make: "Ducati", model: "Monster", description: "Good condition",
       year: 2004, category: "Sport", cc: 250, rate: 50, user: user1 ,
       photo: "Link to a photo", location: "Milan", consumption: 6.5)
ducati.save
yamaha = Bike.new(make: "Yamaha", model: "DoubleX", description: "Fast and steady",
       year: 2015, category: "Sport", cc: 200, rate: 43, user: user1,
       photo: "Link to a photo", location: "Brescia", consumption: 5.3)
yamaha.save
honda = Bike.new(make: "Honda", model: "Roadout", description: "For outdoor",
       year: 1999, category: "Roadster", cc: 125, rate: 20, user: user2 ,
       photo: "Link to a photo", location: "Bergamo", consumption: 7.6)
honda.save
harley = Bike.new(make: "Harley", model: "Luxe", description: "For long distance",
       year: 2004, category: "Street", cc: 300, rate: 55, user: user3,
       photo: "Link to a photo", location: "Milan", consumption: 5.3)
harley.save
kawasaki = Bike.new(make: "kawasaki", model: "OldStyle", description: "Old motorbike but good",
       year:1980, category: "Sport", cc: 125, rate: 20, user: user4,
       photo: "Link to a photo", location: "Crema", consumption: 10.7)
kawasaki.save
bmw = Bike.new(make: "BMW", model: "Roadout", description: "For forest and countryside",
       year:2017, category: "outdoor", cc: 250, rate: 78, user: user4,
       photo: "Link to a photo", location: "Crema", consumption: 7.3)
bmw.save

p "Matching racers!"
# Bookings

booking1 = Booking.new(start_date:"23-02-2018", end_date:"25-02-2018", status: 0,
           user: user1 , bike: ducati)
booking1.save
booking2 = Booking.new(start_date:"30-11-2017", end_date:"12-12-2017", status: 2,
           user: user1 , bike: yamaha)
booking2.save
booking3 = Booking.new(start_date:"03-09-2016", end_date:"17-09-2016", status: 1,
           user: user2, bike: honda)
booking3.save
booking4 = Booking.new(start_date:"30-11-2017", end_date:"12-12-2017", status: 2,
           user: user3, bike: harley)
booking4.save
booking5 = Booking.new(start_date:"26-01-2018", end_date:"28-02-2018", status: 0,
           user: user4, bike: bmw)
booking5.save

p "Filling the racers with magic bios"
# # PROFILES
profile1 = Profile.new(name: "Paolo", photo: "Profile photo", bio: "Italian 32 years old",
experience: 12, user: user1)
profile1.save
profile2 = Profile.new(name: "Marco", photo: "Profile photo", bio: "German 28 years old",
experience: 10, user: user2)
profile2.save
profile3 = Profile.new(name: "Elena", photo: "Profile photo", bio: "Spanish 32 years old",
experience: 2, user: user3)
profile3.save
profile4 = Profile.new(name: "Paolo", photo: "Profile photo", bio: "Italian 45 years old",
experience: 12, user: user4)
profile4.save

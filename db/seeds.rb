puts "Resetting the seeds with golden unicorns"
User.destroy_all
Profile.destroy_all
Bike.destroy_all
Booking.destroy_all

p "Feeding the new racers"
p "Filling the racers with magic bios"
20.times do
  name = Faker::RickAndMorty.character
  named = name.delete(" ", "'").downcase
  u = User.new(email: "#{named}@schwifty.com", password: "1234567")
  Profile.create(name: name, photo: "https://loremflickr.com/300/300/person", bio: Faker::RickAndMorty.quote, experience: rand(20).round, user: u)
  u.save
  end
users = User.all

p "Cooking racers for the rainbow race"
200.times do
  Bike.create(make: Faker::Vehicle.manufacture, model: (Faker::Vehicle.vin).first(3), description: Faker::RickAndMorty.quote,
  year: rand(1950...2018).round, category: Faker::Hipster.word, cc: rand(550).round, rate: Faker::Commerce.price, user: users.sample, location: Faker::Address.street_address,
  consumption: Faker::Commerce.price)
end
bikes = Bike.all

p "Matching racers!"
60.times do
  Booking.create(start_date:Faker::Date.between(60.days.ago, 2.days.ago), end_date: Faker::Date.between(60.days.ago, Date.today), user: users.sample, bike: bikes.sample)
end


puts "Resetting the seeds with golden unicorns"
User.destroy_all
Profile.destroy_all
Bike.destroy_all
Booking.destroy_all

DATA = {
  users: {
    name: %w(Daniel Sonia Cali Giacomo Juan Yuan Angelica Francesco Andy Arbi Fra Michele Michael Marco Daniel Mehdi James),
    },
  bikes: {
    make: %w(ACMA Adly Aeon Andhra-Pradesh-Scooters-Limited Aprilia Auteco The-Auto-Moto Automobile-Products-of-India Autoped B.S.A.-Company Bajaj-Auto Baotian-Motorcycle-Company Benelli BMW-Motorrad Brumana-Pugliese BSA-motorcycles Budd Čezeta Cushman Daelim Daelim-Motor-Company Dafra-Motos Douglas Fenwick-Groupe Flyscooters Garelli-Motorcycle Genuine-Scooters Gilera Heinkel Honda-Motorcycle-and-Scooter-India Honda Hyderabad-Allwyn Industriewerke-Ludwigsfelde Innocenti Iso KR-Motors Kinetic-Engineering-Limited Kymco Lambrett Lohia-Machinery Malaguti MBK Minarelli Motobécane Motob Motor-Z NSU-Motorenwerke Panther-motorcycle Peugeot PGO-Scooters Piaggio Piatti-scooter Polini Puch Scomadi Serveta Siam-Di-Tella Subaru-Corporation Suzuki SYM-Motors Taiwan-Golden-Bee TN'G Triumph-Engineering TVS-Motor-Company Vespa Vyatka Yamaha-Motor-Company YObykes Znen Zündapp),
    model: %w(),
    category: %w(Sport Scooter Outdoor Roadster City Cruiser Chopper Touring Street),
    },
}


p "Feeding REAL users"
  DATA[:users][:name].each do |person|
    name = person.gsub("-", " ").downcase
    u = User.new(email: "#{name}@schwifty.com", password: "1234567")
    Profile.create(name: person, photo: "https://loremflickr.com/300/300/person", bio: Faker::RickAndMorty.quote, experience: rand(20).round, user: u)
    u.save
  end
users = User.all

p "Baking some REAL bikes"
20.times do
  Bike.create(make: DATA[:bikes][:make].sample, model: (Faker::Vehicle.vin).first(3), description: Faker::VForVendetta.quote,
  year: rand(1950...2018).round, category: DATA[:bikes][:category].sample, cc: rand(550).round, rate: Faker::Commerce.price, user: users.sample, location: Faker::Address.street_address,
  consumption: Faker::Commerce.price)
end
bikes = Bike.all

p "Matching!"
60.times do
  Booking.create(start_date:Faker::Date.between(60.days.ago, 2.days.ago), end_date: Faker::Date.between(60.days.ago, Date.today), user: users.sample, bike: bikes.sample)
end


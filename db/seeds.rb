# Clear in dependency order
Car.destroy_all
User.destroy_all
Dealership.destroy_all

# Dealerships
sydney    = Dealership.create!(name: "Sydney City Motors",  slug: "sydney-city-motors",  city: "Sydney")
brisbane  = Dealership.create!(name: "Brisbane Auto Group", slug: "brisbane-auto-group", city: "Brisbane")
melbourne = Dealership.create!(name: "Melbourne Cars",      slug: "melbourne-cars",      city: "Melbourne")

# Users — 2 per dealership
User.create!(email: "staff1@sydneycity.com",     password: "password", dealership: sydney)
User.create!(email: "staff2@sydneycity.com",     password: "password", dealership: sydney)
User.create!(email: "staff1@brisbaneauto.com",   password: "password", dealership: brisbane)
User.create!(email: "staff2@brisbaneauto.com",   password: "password", dealership: brisbane)
User.create!(email: "staff1@melbcars.com",       password: "password", dealership: melbourne)
User.create!(email: "staff2@melbcars.com",       password: "password", dealership: melbourne)

# Cars — spread across dealerships, mixed statuses
[
  { make: "Toyota",     model: "Camry",    year: 2022, price: 28_990, status: "available", vin: "1HGBH41JXMN109186", dealership: sydney },
  { make: "Toyota",     model: "Corolla",  year: 2021, price: 22_990, status: "sold",      vin: "2T1BURHE0JC034761", dealership: sydney },
  { make: "Honda",      model: "Civic",    year: 2023, price: 26_990, status: "available", vin: "19XFC2F59JE001234", dealership: sydney },
  { make: "Ford",       model: "Ranger",   year: 2022, price: 49_990, status: "available", vin: "1FTEW1EF2JFB12345", dealership: brisbane },
  { make: "Mazda",      model: "CX-5",     year: 2023, price: 35_990, status: "available", vin: "JM3KFBBM8J0123456", dealership: brisbane },
  { make: "Hyundai",    model: "Tucson",   year: 2021, price: 31_990, status: "sold",      vin: "5NPE34AF8JH012345", dealership: brisbane },
  { make: "Kia",        model: "Sportage", year: 2022, price: 33_990, status: "available", vin: "KNDP6CAC9J7123456", dealership: melbourne },
  { make: "Volkswagen", model: "Golf",     year: 2023, price: 38_990, status: "available", vin: "WVWZZZ1KZ9W123456", dealership: melbourne },
  { make: "Nissan",     model: "X-Trail",  year: 2021, price: 34_990, status: "sold",      vin: "JN1BZ4EH9AM123456", dealership: melbourne },
].each { |attrs| Car.create!(attrs) }

puts "Seeded #{Dealership.count} dealerships, #{User.count} users, #{Car.count} cars."
puts ""
puts "Login credentials:"
puts "  staff1@sydneycity.com   / password  (Sydney City Motors)"
puts "  staff1@brisbaneauto.com / password  (Brisbane Auto Group)"
puts "  staff1@melbcars.com     / password  (Melbourne Cars)"

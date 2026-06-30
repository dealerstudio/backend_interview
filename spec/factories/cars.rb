FactoryBot.define do
  factory :car do
    make   { "Toyota" }
    model  { "Camry" }
    year   { 2022 }
    price  { 28_990.00 }
    status { "available" }
    sequence(:vin) { |n| "VIN#{n.to_s.rjust(14, '0')}" }
    association :dealership
  end
end

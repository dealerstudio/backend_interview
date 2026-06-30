FactoryBot.define do
  factory :dealership do
    sequence(:name) { |n| "Dealership #{n}" }
    sequence(:slug) { |n| "dealership-#{n}" }
    sequence(:city) { |n| %w[Sydney Brisbane Melbourne Perth Adelaide][n % 5] }
    active { true }
  end
end

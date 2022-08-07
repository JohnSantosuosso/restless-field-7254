FactoryBot.define do
  factory :flight do
    airline
    sequence(:number){ |n| n }
    departure_city{ Faker::Address.city }
    arrival_city{ Faker::Address.city }
    date {Date.today}
  end
end
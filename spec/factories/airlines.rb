FactoryBot.define do
  factory :airline do
    sequence(:name){ |n| "#{n}American" }
  end
end
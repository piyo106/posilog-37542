FactoryBot.define do
  factory :log do
    content {Faker::Lorem.sentence}
    category_id { Faker::Number.between(from: 2, to: 5) }
    association :goal
  end
end

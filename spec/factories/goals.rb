FactoryBot.define do
  factory :goal do
    title {Faker::Lorem.sentence}
    purpose {Faker::Lorem.sentence}
    tag_id { Faker::Number.between(from: 2, to: 3) }
  end
end
FactoryBot.define do
  factory :tag do
    name           { Faker::Lorem.word }
    officiality_id { rand(0..2) }
  end
end

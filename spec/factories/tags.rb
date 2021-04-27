FactoryBot.define do
  factory :tag do
    name           { Faker::Lorem.word }
    officiality_id { 0 }
  end
end

FactoryBot.define do
  factory :sign do
    text  { Faker::Lorem.sentence }
    association :user
  end
end

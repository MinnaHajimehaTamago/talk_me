FactoryBot.define do
  factory :sign_tag_relation do
    association :sign
    association :tag
  end
end
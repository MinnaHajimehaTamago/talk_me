FactoryBot.define do
  factory :personal_information do
    first_name      { '太郎' }
    last_name       { '玉子' }
    first_name_kana { 'タロウ' }
    last_name_kana  { 'タマゴ' }
    birth_date      { '2021/01/01' }
    association :user
  end
end
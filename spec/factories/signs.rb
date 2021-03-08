FactoryBot.define do
  factory :sign do
    first_name        { '太郎' }
    last_name         { '玉子' }
    first_name_kana   { 'タロウ' }
    last_name_kana    { 'タマゴ' }
    state_id          { 2 }
    city              { '玉子市' }
    spot_type_id      { 2 }
    position_id       { 2 }
    characteristic_id { 2 }
    content_id        { 2 }
    association :user
  end
end

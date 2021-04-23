FactoryBot.define do
  factory :user do
    nickname              { 'テストユーザー' }
    email                 { 'test1@example.com' }
    password              { 'password' }
    password_confirmation { password }
    after(:build) do |user|
      user.image.attach(io: File.open('public/kumao0.png'), filename: 'kumao0.png')
    end
  end
end

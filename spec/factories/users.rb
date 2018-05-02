FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password "password"
    password_confirmation "password"
    phone "+79000000000"
    role :user
    confirmed_at Date.today
  end
end

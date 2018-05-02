FactoryBot.define do
  factory :user, class: User do
    email { Faker::Internet.email }
    password "password"
    password_confirmation "password"
    phone '+79000000000'
    role :user
  end
end

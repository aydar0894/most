FactoryBot.define do
  factory :user, class: User do
    email { Faker::Internet.email }
    password "password"
    password_confirmation "password"
    phone '+79000000000'
    role :user
    confirmed_at Date.today
  end

  factory :admin, class: User do
    email { Faker::Internet.email }
    password "password"
    password_confirmation "password"
    phone '+79000000000'
    role :admin
    confirmed_at Date.today
  end

  factory :organizer, class: User do
    email { Faker::Internet.email }
    password "password"
    password_confirmation "password"
    phone '+79000000000'
    role :organizer
    confirmed_at Date.today
  end
end

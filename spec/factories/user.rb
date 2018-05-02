FactoryBot.define do
  factory :user, class: User do
    email { Faker::Internet.email }
    password "password"
    password_confirmation "password"
    phone '+79000000000'
    role :user
  end
<<<<<<< HEAD

  factory :admin, class: User do
    email { Faker::Internet.email }
    password "password"
    password_confirmation "password"
    phone '+79000000000'
    role :admin
  end
=======
>>>>>>> 9c1f502a3d1eecc8cbfb34bd06ebb614f46243ca
end

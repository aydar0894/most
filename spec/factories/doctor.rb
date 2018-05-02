FactoryBot.define do
  factory :doctor, class: Doctor do
    association :user, factory: :user, phone: '+79992211333', role: :doctor, strategy: :create
    first_name "DocName"
    last_name "DocLastName"
    middle_name "DocMiddleName"
<<<<<<< HEAD
    birth_date Date.current

  end
  factory :doctor_invalid, class: Doctor do
    association :user, factory: :user, phone: '+79992211333', role: :doctor, strategy: :create
    last_name "DocLastName"
    middle_name "DocMiddleName"
    birth_date Date.current
=======
    birth_date Date.today
>>>>>>> 9c1f502a3d1eecc8cbfb34bd06ebb614f46243ca
  end
end

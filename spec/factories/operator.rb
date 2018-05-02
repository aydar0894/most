FactoryBot.define do
<<<<<<< HEAD
    factory :operator, class: Operator do
        association :user, factory: :user, phone: '+79991124333', role: :operator, strategy: :create
    end

    factory :operator_invalid, class: Operator do
        association :user, factory: :user, phone: '+79991124333', role: :operator, strategy: :create
    end
=======
  factory :operator, class: Operator do
    association :user, factory: :user, phone: '+79991124333', role: :operator, strategy: :create
    first_name "OpName"
    last_name "OpLastName"
    middle_name "OpMiddleName"
  end
>>>>>>> 9c1f502a3d1eecc8cbfb34bd06ebb614f46243ca
end

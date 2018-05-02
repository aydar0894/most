FactoryBot.define do
<<<<<<< HEAD
    factory :organizer, class: Organizer do
        association :user, factory: :user, phone: '+79991122333', role: :organizer, strategy: :create
        company_name "ABC Med"
    end

    factory :organizer_invalid, class: Organizer do
        association :user, factory: :user, phone: '+79991122333', role: :organizer, strategy: :create
    end
=======
  factory :organizer, class: Organizer do
    association :user, factory: :user, phone: '+79991122333', role: :organizer, strategy: :create
    company_name "CompanyName"
  end
>>>>>>> 9c1f502a3d1eecc8cbfb34bd06ebb614f46243ca
end

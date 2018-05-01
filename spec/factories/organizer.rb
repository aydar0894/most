FactoryBot.define do 
    factory :organizer, class: Organizer do
        association :user, factory: :user, phone: '+79991122333', role: :organizer, strategy: :create
    end
end
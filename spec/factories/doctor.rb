FactoryBot.define do 
    factory :doctor, class: Doctor do
        association :user, factory: :user, phone: '+79992211333', role: :doctor, strategy: :create
    end
end
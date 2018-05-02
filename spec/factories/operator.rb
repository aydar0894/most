FactoryBot.define do
    factory :operator, class: Operator do
        association :user, factory: :user, phone: '+79991124333', role: :operator, strategy: :create
    end

    factory :operator_invalid, class: Operator do
        association :user, factory: :user, phone: '+79991124333', role: :operator, strategy: :create
    end
end

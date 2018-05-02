FactoryBot.define do
  factory :operator, class: Operator do
    association :user, factory: :user, phone: '+79991124333', role: :operator, strategy: :create
    first_name "OpName"
    last_name "OpLastName"
    middle_name "OpMiddleName"
  end

  factory :operator_invalid, class: Operator do
      association :user, factory: :user, phone: '+79991124333', role: :operator, strategy: :create
      last_name "OpLastName"
      middle_name "OpMiddleName"
  end

end

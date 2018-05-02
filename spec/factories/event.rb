FactoryBot.define do
  factory :event do
    title 'Title'
    description 'Description'
    start Date.today
    finish Date.today
  end
end

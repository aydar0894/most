FactoryBot.define do
  factory :event, class: Event do
    association :organizer, factory: :organizer
    title 'Valid Title'
    description 'Description'
    start (DateTime.current - 1.day)
    finish (DateTime.current + 1.day)
  end

  factory :event_invalid, class: Event do
    title 'Title'
    description 'Description'
    start (DateTime.current - 1.day)
    finish (DateTime.current + 1.day)
  end


  factory :event_future, class: Event do
    association :organizer, factory: :organizer
    title 'Valid Title'
    description 'Description'
    start (DateTime.current + 1.day)
    finish (DateTime.current + 2.day)
  end
end

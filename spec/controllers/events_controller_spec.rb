require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  # before(:each) do
  #   @event = build(:user)
  # end

  let(:event)    { FactoryBot.build(:event) }
  let(:organizer)    { FactoryBot.build(:organizer) }

  it "should create event" do
    assert_difference('Event.count') do
      organizer.save!
      organizer_profile = Organizer.create({
        user_id: organizer.id,
        company_name: 'Company name'
      })
      event.organizer_id = organizer_profile.id
      event.save!
    end

    expect(response).to be_success
  end
end

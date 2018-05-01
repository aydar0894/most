require 'rails_helper'
require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  # before(:each) do
  #   @event = build(:user)
  # end

  let(:event)    { FactoryBot.build(:event) }
  let(:organizer)    { FactoryBot.build(:organizer) }
  # subject          { event }
  #
  # it "should get index" do
  #   get events_url
  #   expect(response).to be_success
  # end
  #
  # it "should get new" do
  #   get new_event_url
  #   expect(response).to be_success
  # end

  it "should create event" do
    assert_difference('Event.count') do
      # abort event.inspect
      # post :create, params: { event: { finish: event.finish, organizer_id: event.organizer_id, start: event.start, title: event.title } }
      organizer.save!
      # abort user.inspect
      organizer_profile = Organizer.create({
        user_id: organizer.id,
        company_name: 'Company name'
      })
      event.organizer_id = organizer_profile.id
      # abort event.inspect
      event.save!
    end
    #
    # expect{
    #   Event.count
    # }.to change{Counter.count}.by(2)

    expect(response).to redirect_to(event)
  end
  #
  # it "should show event" do
  #   get event_url(@event)
  #   expect(response).to be_success
  # end
  #
  # it "should get edit" do
  #   get edit_event_url(@event)
  #   expect(response).to be_success
  # end
  #
  # it "should update event" do
  #   patch event_url(@event), params: { event: { finish: @event.finish, organizer_id: @event.organizer_id, start: @event.start, title: @event.title } }
  #   # expect(response).to redirect_to(event_url(@event))
  #   response.should redirect_to(@event)
  # end
  #
  # it "should destroy event" do
  #   assert_difference('Event.count', -1) do
  #     delete event_url(@event)
  #   end
  #
  #   expect(response).to redirect_to(events_url)
  # end
end

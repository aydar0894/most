require 'rails_helper'

RSpec.describe "organizers/my_events", type: :view do
  before(:each) do
    @events = assign(:events, [
      FactoryBot.create(:event),
      FactoryBot.create(:event),
      FactoryBot.create(:event)
    ])

    @organizer = assign(:organizer, FactoryBot.create(:organizer))
    @all_events = Event.all
    @current_events = @all_events.where('start <= ? AND finish >= ?', DateTime.current, DateTime.current)
    @upcoming_events = @all_events.where('start >= ?', DateTime.current)
    @archive_events = @all_events.where('finish <= ?', DateTime.current)
    assign(:organizer_id, @organizer.id)
    assign(:all_events, @all_events)
    assign(:current_events, @current_events)
    assign(:upcoming_events, @upcoming_events)
    assign(:archive_events, @archive_events)

    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in @organizer.user
  end

  it "renders a list of events of organizer" do
    render

    expect(rendered).to have_selector("#all-events table tbody tr", count: @all_events.count)
    expect(rendered).to have_selector("#ongoing-events table tbody tr", count: @current_events.count)
    expect(rendered).to have_selector("#scheduled-events table tbody tr", count: @upcoming_events.count)
    expect(rendered).to have_selector("#archive-events table tbody tr", count: @archive_events.count)
  end
end

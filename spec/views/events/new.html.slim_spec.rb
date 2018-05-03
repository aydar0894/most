require 'rails_helper'

RSpec.describe "events/new", type: :view do
  before(:each) do
    @event = assign(:event, Event.new)
    @organizer = assign(:organizer, FactoryBot.create(:organizer))

    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in @organizer.user
  end

  it "renders new event form" do
    render

    expect(rendered).to have_selector(".container .panel h3", text: "Создание мероприятия")

    assert_select "form[action=?][method=?]", organizer_events_path(@organizer.id), "post" do
      expect(rendered).to have_field("Название")
      expect(rendered).to have_field("Описание")
      expect(rendered).to have_field("Место проведения")
      expect(rendered).to have_selector("#event_logo")
      expect(rendered).to have_selector("#event_max_participants")
      expect(rendered).to have_selector("#event_start_5i")
      expect(rendered).to have_selector("#event_start_4i")
      expect(rendered).to have_selector("#event_start_3i")
      expect(rendered).to have_selector("#event_start_2i")
      expect(rendered).to have_selector("#event_start_1i")

      expect(rendered).to have_selector("#event_finish_5i")
      expect(rendered).to have_selector("#event_finish_4i")
      expect(rendered).to have_selector("#event_finish_3i")
      expect(rendered).to have_selector("#event_finish_2i")
      expect(rendered).to have_selector("#event_finish_1i")

      expect(rendered).to have_selector("input[type=submit]")
      expect(rendered).to have_selector(".btn-back")
    end
  end
end

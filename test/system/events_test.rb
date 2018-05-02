require "application_system_test_case"
require "rails_helper"


RSpec.describe "Widget management", :type => :system do
  before do
    driven_by(:rack_test)
  end

  it "enables me to create widgets" do
    visit "/widgets/new"

    fill_in "Name", :with => "My Widget"
    click_button "Create Widget"

    expect(page).to have_text("Widget was successfully created.")
  end
end


class EventsTest < ApplicationSystemTestCase
  # test "visiting the index" do
  #   visit events_url
  #
  #   assert_selector "h1", text: "Event"
  # end
end

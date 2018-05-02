require "rails_helper"
require 'capybara/rspec'


RSpec.describe "Organizer cabinet", :type => :system do
  before do
    driven_by(:selenium_chrome_headless)
  end

  it "Provide opportunity to create an event to organizers" do

    visit "/users/sign_in"

    # login_as(:user, )
    # fill_in "login-input", :with => ""
    # fill_in "Name", :with => "My Widget"
    # click_button "Create Widget"

    # expect(page).to have_text("Widget was successfully created.")
  end
end
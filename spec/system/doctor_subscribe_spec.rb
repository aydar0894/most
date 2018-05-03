require "rails_helper"
require 'capybara/rspec'
include ControllerMacros

RSpec.describe "Doctor cabinet", :type => :system do
  before do
    driven_by(:selenium_chrome_headless)
  end

  it "provides opportunity for an event subscription to doctors" do

    # visit "/users/sign_in"
    login_doctor
    
    visit '/doctors'

    # login_as(:user, )
    # fill_in "login-input", :with => ""
    # fill_in "Name", :with => "My Widget"
    # click_button "Create Widget"

    # expect(page).to have_text("Widget was successfully created.")
  end

  it "ensures that subscription applies only for subscribed user" do 
  end

  
end
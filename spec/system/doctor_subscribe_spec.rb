require "rails_helper"
require 'capybara/rspec'
# include ControllerMacros

RSpec.describe "Doctor cabinet", :type => :system do
  before do
    driven_by(:selenium_chrome_headless)
  end

  it "provides opportunity for an event subscription to doctors" do


    event = FactoryBot.create(:event_future)

    # visit "/users/sign_in"
    doctor = FactoryBot.create(:doctor)
    user = doctor.user

    login_as(user, :scope => :user)
    
    visit doctor_path(doctor)

    click_link "doctor-available-events"


    expect(page).to have_text(event.title.to_s)
  end

  it "ensures that subscription applies only to subscribed doctor" do

    event = FactoryBot.create(:event_future)

    doctor = FactoryBot.create(:doctor)
    user = doctor.user

    login_as(user, :scope => :user)

    visit doctor_path(doctor)

    # click_link "docto"

    click_link "doctor-available-events"

    click_link "event-link-#{event.id}"
    
    visit registered_doctor_events_path(doctor)
    
    expect(page).to have_text(event.title.to_s)

    visit available_doctor_events_path(doctor)

    expect(page).to have_no_text(event.title.to_s)
  end

  
end
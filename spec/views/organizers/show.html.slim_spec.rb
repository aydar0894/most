require 'rails_helper'

RSpec.describe "organizers/show", type: :view do
  before(:each) do
    @organizer = assign(:organizer, FactoryBot.create(:organizer))

    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in @organizer.user
  end

  it "renders attributes" do
    render

    expect(rendered).to have_selector(".container .panel h3", text: "Профиль организатора")

    expect(rendered).to have_content(@organizer.company_name)
    expect(rendered).to have_content(@organizer.user.email)
  end
end

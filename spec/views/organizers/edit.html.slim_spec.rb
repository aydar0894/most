require 'rails_helper'

RSpec.describe "organizers/edit", type: :view do
  before(:each) do
    @organizer = assign(:organizer, FactoryBot.create(:organizer))

    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in @organizer.user
  end

  it "renders the edit organizer form" do
    render

    expect(rendered).to have_selector(".container .panel h3", text: "Изменение организатора")

    assert_select "form[action=?][method=?]", organizer_path(@organizer), "post" do
      expect(rendered).to have_field("Название компании", with: @organizer.company_name)

      expect(rendered).to have_selector("input[type=submit]")
      expect(rendered).to have_selector(".btn-back")
    end
  end
end

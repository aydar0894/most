require 'rails_helper'

RSpec.describe "operators/index", type: :view do
  before(:each) do
    @operators = assign(:operators, [
      FactoryBot.create(:operator),
      FactoryBot.create(:operator),
      FactoryBot.create(:operator)
    ])

    @organizer = FactoryBot.create(:organizer)
    assign(:organizer, @organizer)

    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in @organizer.user
  end

  it "renders a list of operators" do
    render

    expect(rendered).to have_selector(".container .panel h3", text: "Управление операторами")

    expect(rendered).to have_selector("#operators-table tbody tr", count: @operators.count)
  end
end

require 'rails_helper'

RSpec.describe "operators/edit", type: :view do
  before(:each) do
    @operator = assign(:operator, FactoryBot.create(:operator))
    @organizer = FactoryBot.create(:organizer)

    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in @organizer.user
  end

  it "renders the edit operator form" do
    render

    expect(rendered).to have_selector(".container .panel h3", text: "Изменение оператора")

    assert_select "form[action=?][method=?]", operator_path(@operator), "post" do
      expect(rendered).to have_field("Имя")
      expect(rendered).to have_field("Фамилия")
      expect(rendered).to have_field("Отчество")
      expect(rendered).to have_field("Email")
      expect(rendered).to have_field("Номер телефона")

      expect(rendered).to have_selector("input[type=submit]")
      expect(rendered).to have_selector(".btn-back")
    end
  end
end

require 'rails_helper'

RSpec.describe "operators/new", type: :view do
  before(:each) do
    @operator = assign(:operator, Operator.new())
    @organizer = FactoryBot.create(:organizer)

    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in @organizer.user
  end

  it "renders new operator form" do
    render

    expect(rendered).to have_selector(".container .panel h3", text: "Создание оператора")

    assert_select "form[action=?][method=?]", operators_path, "post" do
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

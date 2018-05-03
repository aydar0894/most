require 'rails_helper'

RSpec.describe "doctors/edit", type: :view do
  before(:each) do
    @doctor = assign(:doctor, FactoryBot.create(:doctor))
  end

  it "renders the edit doctor form" do
    render

    expect(rendered).to have_selector(".container .panel h3", text: "Изменение доктора")

    assert_select "form[action=?][method=?]", doctor_path(@doctor), "post" do
      expect(rendered).to have_field("Имя", with: @doctor.first_name)
      expect(rendered).to have_field("Фамилия", with: @doctor.last_name)
      expect(rendered).to have_field("Отчество", with: @doctor.middle_name)
      expect(rendered).to have_selector("#doctor_avatar")
      expect(rendered).to have_selector("#doctor_birth_date_5i")
      expect(rendered).to have_selector("#doctor_birth_date_4i")
      expect(rendered).to have_selector("#doctor_birth_date_3i")
      expect(rendered).to have_selector("#doctor_birth_date_2i")
      expect(rendered).to have_selector("#doctor_birth_date_1i")
      expect(rendered).to have_selector("input[type=submit]")
    end
  end
end

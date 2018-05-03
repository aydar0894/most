require 'rails_helper'

RSpec.describe "doctors/show", type: :view do
  before(:each) do
    @doctor = assign(:doctor, FactoryBot.create(:doctor))
  end

  it "renders attributes" do
    render

    expect(rendered).to have_selector("p.name", text: @doctor.full_name)
  end

  it "renders edit profile link" do
    render

    expect(rendered).to have_selector("#doctor-edit-profile")
  end

end

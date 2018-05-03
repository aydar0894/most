require 'rails_helper'

RSpec.describe "doctors/edit", type: :view do

  let(:valid_attributes) {
    FactoryBot.create(:doctor).attributes
  }

  let(:invalid_attributes) {
    FactoryBot.create(:doctor_invalid).attributes
  }

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @doctor = FactoryBot.create(:doctor)
  end

  it "renders the edit doctor form" do
    assign(:doctor, @doctor)

    render

    expect(rendered).to have_field('Имя')
    # en
  end
end

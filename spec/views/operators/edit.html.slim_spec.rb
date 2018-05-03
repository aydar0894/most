require 'rails_helper'

RSpec.describe "operators/edit", type: :view do

  let(:valid_attributes) {
    FactoryBot.create(:operator).attributes
  }

  let(:invalid_attributes) {
    FactoryBot.create(:operator_invalid).attributes
  }

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @operator = FactoryBot.create(:operator)
  end

  it "renders the edit doctor form" do
    assign(:operator, @operator)

    render

    expect(rendered).to have_field('Имя')
    # en
  end
end

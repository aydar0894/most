require 'rails_helper'

RSpec.describe "organizers/edit", type: :view do

  let(:valid_attributes) {
    FactoryBot.create(:organizer).attributes
  }

  let(:invalid_attributes) {
    FactoryBot.create(:organizer_invalid).attributes
  }

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @organizer = FactoryBot.create(:organizer)
  end

  it "renders the edit doctor form" do
    assign(:organizer, @organizer)

    render

    expect(rendered).to have_field('Имя')
    # en
  end
end

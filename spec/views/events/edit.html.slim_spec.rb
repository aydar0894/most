require 'rails_helper'

RSpec.describe "events/edit", type: :view do

  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # before(:each) do
    
  # end
  
  it "renders the edit event form" do
    @event = Event.create! valid_attributes
    assign(:event, @event)
    
    render

    expect(rendered).to have_field('Логотип')
  end
end

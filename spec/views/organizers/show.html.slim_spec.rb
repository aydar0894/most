require 'rails_helper'

RSpec.describe "organizers/show", type: :view do
  before(:each) do
    @organizer = assign(:organizer, Organizer.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end

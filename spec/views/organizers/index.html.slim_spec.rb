require 'rails_helper'

RSpec.describe "organizers/index", type: :view do
  before(:each) do
    assign(:organizers, [
      Organizer.create!(),
      Organizer.create!()
    ])
  end

  it "renders a list of organizers" do
    render
  end
end

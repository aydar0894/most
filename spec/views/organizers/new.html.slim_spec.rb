require 'rails_helper'

RSpec.describe "organizers/new", type: :view do
  before(:each) do
    assign(:organizer, Organizer.new())
  end

  it "renders new organizer form" do
    render

    assert_select "form[action=?][method=?]", organizers_path, "post" do
    end
  end
end

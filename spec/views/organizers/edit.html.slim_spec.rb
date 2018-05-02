require 'rails_helper'

RSpec.describe "organizers/edit", type: :view do
  before(:each) do
    @organizer = assign(:organizer, Organizer.create!())
  end

  it "renders the edit organizer form" do
    render

    assert_select "form[action=?][method=?]", organizer_path(@organizer), "post" do
    end
  end
end

require "rails_helper"

describe "layout/_landing_navigation.html.slim" do

    before do
        @user = User.create!(phone: "+79172331519", password: "qwqeqwe", email: "qwe@qwe.qwe")
        render
    end

    it "asks you to sign in if you are not signed in" do
        # render
        rendered.should have_content('Выйти')
    end

end
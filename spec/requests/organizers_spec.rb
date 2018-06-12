require 'rails_helper'

RSpec.describe "Organizers", type: :request do
  
  describe "GET /organizers" do

    let(:valid_attributes) {
      FactoryBot.build(:organizer).attributes
    }
  
    let(:invalid_attributes) {
      FactoryBot.build(:organizer_invalid).attributes
    }


    before(:each) do
      admin = FactoryBot.create(:admin)
      @organazier = FactoryBot.create(:organizer)
      post user_session_path, params:{user: {login: admin.phone, password: admin.password } }
    end

    it "send list of operator" do
      
      count_organizer = Organizer.count

      get organizers_path+".json"

      expect(response).to have_http_status(200)
      expect(json_body['organizers'].length).to eq(count_organizer)
    end

    it "update a organizer" do

      post organizers_path+".json", params:{organizer: FactoryBot.build(:organizer).attributes}

      expect(response).to have_http_status(201)

    end

    it "create a organizer" do

      post organizers_path+".json", params:{organizer: FactoryBot.build(:organizer).attributes}
      expect(response).to have_http_status(201)
    end

    it "show a organizer with" do 

      organizer = Organizer.create! valid_attributes
      get organizer_path(organizer)+".json"
      expect(response).to be_success
      
    end


    it "destroy a organizer" do 

      organizer = Organizer.create! valid_attributes
      delete organizer_path(organizer)
      expected_organizer = Organizer.find_by_id(organizer.id)
      expect(expected_organizer).to eq(nil)
      
    end


  end
end

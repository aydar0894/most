require 'rails_helper'

RSpec.describe "Events", type: :request do

  let(:valid_attributes) {
    FactoryBot.build(:event).attributes
  }

  let(:invalid_attributes) {
    FactoryBot.build(:event_invalid).attributes
  }

  before(:each) do
      admin = FactoryBot.create(:admin)
      @event = FactoryBot.create(:event)
      post user_session_path, params:{user: {login: admin.phone, password: admin.password } }
    end

    it "send list of events" do
      
      count_event = Event.count

      get events_path+".json"

      expect(response).to have_http_status(200)
      
      expect(json_body['events'].length).to eq(count_event)
    end
    
    it "create a event" do

      # get events_path+".json"

      organizator = FactoryBot.create(:organizer)
      factory_event = FactoryBot.build(:event)

      post organizer_events_path(organizer_id: organizator.id)+".json", params:{event: factory_event.attributes}

      # pp json_body['events']
      expect(response).to have_http_status(201)
      # assert_redirected_to(:controller => "events", :action => "show")
      # expect(json_body['events'].status).to eq("created")
      # expect(response).to redirect_to(event_path(JSON.parse(response.body)["id"]))
    end

    it "update a event" do

      event = Event.create! valid_attributes
      organizator = FactoryBot.create(:organizer)

      put organizer_event_path(organizer_id: organizator.id, id: event.id)+".json", params:{event: {title: "UpdatedName"}}

      expect(Event.find(event.id).title).to eq("UpdatedName")

    end

    it "show a event with" do 

      # post events_path+".json", params:{event: FactoryBot.build(:event).attributes}

      # expect(response).to have_http_status(201)
      event = Event.create! valid_attributes

      get event_path(event)+".json"
      expect(response).to be_success
      
    end


    it "destroy a event" do 

      event = Event.create! valid_attributes
      organizator = FactoryBot.create(:organizer)

      delete organizer_event_path(organizer_id: organizator.id, id: event.id)

      expected_event = Event.find_by_id(event.id)

      expect(expected_event).to eq(nil)
      
    end
end
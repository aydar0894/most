require 'rails_helper'


RSpec.describe EventsController, type: :controller do

  let(:valid_attributes) {
    FactoryBot.build(:event).attributes
  }

  let(:invalid_attributes) {
    FactoryBot.build(:event_invalid).attributes
  }

  describe "admin actions" do

    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      admin = FactoryBot.create(:admin)
      sign_in admin
    end

    def valid_session
      {"warden.user.user.key" => session["warden.user.user.key"]}
    end

    describe "GET #index" do
      it "returns a success response" do
        event = Event.create! valid_attributes
        get :index, params: {}, session: valid_session
        expect(response).to be_success
      end
    end

    describe "GET #show" do
      it "returns a success response" do
        event = Event.create! valid_attributes
        get :show, params: {id: event.to_param}, session: valid_session
        expect(response).to be_success
      end
    end

    describe "GET #new" do
      it "returns a success response" do
        get :new, params: {}, session: valid_session
        expect(response).to be_success
      end
    end

    describe "GET #edit" do
      it "returns a success response" do
        event = Event.create! valid_attributes
        get :edit, params: {id: event.to_param}, session: valid_session
        expect(response).to be_success
      end
    end

    describe "POST #create" do
      context "with valid params" do
        it "creates a new Event" do
          expect {
            post :create, params: {event: valid_attributes}, session: valid_session
          }.to change(Event, :count).by(1)
        end

        it "redirects to the created event" do
          post :create, params: {event: valid_attributes}, session: valid_session
          expect(response).to redirect_to(Event.last)
        end
      end

      context "with invalid params" do
        it "returns a success response (i.e. to display the 'new' template)" do
          post :create, params: {event: invalid_attributes}, session: valid_session
          expect(response).to be_success
        end
      end
    end

    describe "PUT #update" do
      context "with valid params" do
        let(:new_attributes) {
          skip("Add a hash of attributes valid for your model")
        }

        it "updates the requested event" do
          event = Event.create! valid_attributes
          put :update, params: {id: event.to_param, event: new_attributes}, session: valid_session
          event.reload
          skip("Event has been updated")
        end

        it "redirects to the event" do
          event = Event.create! valid_attributes
          put :update, params: {id: event.to_param, event: valid_attributes}, session: valid_session
          expect(response).to redirect_to(event)
        end
      end

      context "with invalid params" do
        it "returns a success response (i.e. to display the 'edit' template)" do
          event = Event.create! valid_attributes
          put :update, params: {id: event.to_param, event: invalid_attributes}, session: valid_session
          expect(response).to be_success
        end
      end
    end

    describe "DELETE #destroy" do
      it "destroys the requested event" do
        event = Event.create! valid_attributes
        expect {
          delete :destroy, params: {id: event.to_param}, session: valid_session
        }.to change(Event, :count).by(-1)
      end

      it "redirects to the events list" do
        event = Event.create! valid_attributes
        delete :destroy, params: {id: event.to_param}, session: valid_session
        expect(response).to redirect_to(events_url)
      end
    end
  end


  describe "operator actions" do
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      operator = FactoryBot.create(:operator)
      sign_in operator.user
    end

    def valid_session
      {"warden.user.user.key" => session["warden.user.user.key"]}
    end


    describe "GET #index" do
      it "returns a success response" do
        event = Event.create! valid_attributes
        get :index, params: {}, session: valid_session
        expect(response).to be_success
      end
    end

    describe "GET #show" do
      it "returns a success response" do
        event = Event.create! valid_attributes
        get :show, params: {id: event.to_param}, session: valid_session
        expect(response).to be_success
      end
    end

    describe "GET #new" do
      it "redirects to the root path" do
        get :new, params: {}, session: valid_session
        expect(response).to redirect_to(root_path)
      end
    end

    describe "GET #edit" do
      it "redirects to the root path" do
        event = Event.create! valid_attributes
        get :edit, params: {id: event.to_param}, session: valid_session
        expect(response).to redirect_to(root_path)
      end
    end

    describe "POST #create" do
      context "with valid params" do
        it "redirects to the root path" do
          post :create, params: {event: valid_attributes}, session: valid_session
          expect(response).to redirect_to(root_path)
        end
      end

      context "with invalid params" do
        it "redirects to the root path" do
          post :create, params: {event: invalid_attributes}, session: valid_session
          expect(response).to redirect_to(root_path)
        end
      end
    end

    describe "PUT #update" do
      context "with valid params" do
        it "redirects to the root path" do
          event = Event.create! valid_attributes
          put :update, params: {id: event.to_param, event: valid_attributes}, session: valid_session
          expect(response).to redirect_to(root_path)
        end
      end

      context "with invalid params" do
        it "redirects to the root path" do
          event = Event.create! valid_attributes
          put :update, params: {id: event.to_param, event: invalid_attributes}, session: valid_session
          expect(response).to redirect_to(root_path)
        end
      end
    end

    describe "DELETE #destroy" do
      it "redirects to the root path" do
        event = Event.create! valid_attributes
        delete :destroy, params: {id: event.to_param}, session: valid_session
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe "organizer actions" do
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      organizer = FactoryBot.create(:organizer)
      sign_in organizer.user
    end

    def valid_session
      {"warden.user.user.key" => session["warden.user.user.key"]}
    end

    describe "GET #index" do
      it "returns a success response" do
        event = Event.create! valid_attributes
        get :index, params: {}, session: valid_session
        expect(response).to be_success
      end
    end

    describe "GET #show" do
      it "returns a success response" do
        event = Event.create! valid_attributes
        get :show, params: {id: event.to_param}, session: valid_session
        expect(response).to be_success
      end
    end

    describe "GET #new" do
      it "returns a success response" do
        get :new, params: {}, session: valid_session
        expect(response).to be_success
      end
    end

    describe "GET #edit" do
      it "returns a success response" do
        event = Event.create! valid_attributes
        get :edit, params: {id: event.to_param}, session: valid_session
        expect(response).to be_success
      end
    end

    describe "POST #create" do
      context "with valid params" do
        it "creates a new Event" do
          expect {
            post :create, params: {event: valid_attributes}, session: valid_session
          }.to change(Event, :count).by(1)
        end

        it "redirects to the created event" do
          post :create, params: {event: valid_attributes}, session: valid_session
          expect(response).to redirect_to(Event.last)
        end
      end

      context "with invalid params" do
        it "returns a success response (i.e. to display the 'new' template)" do
          post :create, params: {event: invalid_attributes}, session: valid_session
          expect(response).to be_success
        end
      end
    end

    describe "PUT #update" do
      context "with valid params" do
        let(:new_attributes) {
          skip("Add a hash of attributes valid for your model")
        }

        it "updates the requested event" do
          event = Event.create! valid_attributes
          put :update, params: {id: event.to_param, event: new_attributes}, session: valid_session
          event.reload
          skip("Add assertions for updated state")
        end

        it "redirects to the event" do
          event = Event.create! valid_attributes
          put :update, params: {id: event.to_param, event: valid_attributes}, session: valid_session
          expect(response).to redirect_to(event)
        end
      end

      context "with invalid params" do
        it "returns a success response (i.e. to display the 'edit' template)" do
          event = Event.create! valid_attributes
          put :update, params: {id: event.to_param, event: invalid_attributes}, session: valid_session
          expect(response).to be_success
        end
      end
    end

    describe "DELETE #destroy" do
      it "destroys the requested event" do
        event = Event.create! valid_attributes
        expect {
          delete :destroy, params: {id: event.to_param}, session: valid_session
        }.to change(Event, :count).by(-1)
      end

      it "redirects to the events list" do
        event = Event.create! valid_attributes
        delete :destroy, params: {id: event.to_param}, session: valid_session
        expect(response).to redirect_to(events_url)
      end
    end
  end

  describe "doctor actions" do
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      doctor = FactoryBot.create(:doctor)
      sign_in doctor.user
    end

    def valid_session
      {"warden.user.user.key" => session["warden.user.user.key"]}
    end

    describe "GET #index" do
      it "returns a success response" do
        event = Event.create! valid_attributes
        get :index, params: {}, session: valid_session
        expect(response).to be_success
      end
    end

    describe "GET #show" do
      it "returns a success response" do
        event = Event.create! valid_attributes
        get :show, params: {id: event.to_param}, session: valid_session
        expect(response).to be_success
      end
    end

    describe "GET #new" do
      it "redirects to the root path" do
        get :new, params: {}, session: valid_session
        expect(response).to redirect_to(root_path)
      end
    end

    describe "GET #edit" do
      it "redirects to the root path" do
        event = Event.create! valid_attributes
        get :edit, params: {id: event.to_param}, session: valid_session
        expect(response).to redirect_to(root_path)
      end
    end

    describe "POST #create" do
      context "with valid params" do
        it "redirects to the root path" do
          post :create, params: {event: valid_attributes}, session: valid_session
          expect(response).to redirect_to(root_path)
        end
      end

      context "with invalid params" do
        it "redirects to the root path" do
          post :create, params: {event: invalid_attributes}, session: valid_session
          expect(response).to redirect_to(root_path)
        end
      end
    end

    describe "PUT #update" do
      context "with valid params" do
        let(:new_attributes) {
          skip("Add a hash of attributes valid for your model")
        }

        it "redirects to the root path" do
          event = Event.create! valid_attributes
          put :update, params: {id: event.to_param, event: valid_attributes}, session: valid_session
          expect(response).to redirect_to(root_path)
        end
      end

      context "with invalid params" do
        it "redirects to the root path" do
          event = Event.create! valid_attributes
          put :update, params: {id: event.to_param, event: invalid_attributes}, session: valid_session
          expect(response).to redirect_to(root_path)
        end
      end
    end

    describe "DELETE #destroy" do
      it "redirects to the root path" do
        event = Event.create! valid_attributes
        delete :destroy, params: {id: event.to_param}, session: valid_session
        expect(response).to redirect_to(root_path)
      end
    end
  end
end

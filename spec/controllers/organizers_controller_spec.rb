require 'rails_helper'


RSpec.describe OrganizersController, type: :controller do

  let(:valid_attributes) {
    FactoryBot.build(:organizer).attributes
  }

  let(:invalid_attributes) {
    FactoryBot.build(:organizer_invalid).attributes
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

    describe "GET #index admin" do
      it "returns a success response" do
        organizer = Organizer.create! valid_attributes
        get :index, params: {}, session: valid_session
        expect(response).to be_success
      end
    end

    describe "GET #show admin" do
      it "returns a success response" do
        organizer = Organizer.create! valid_attributes
        get :show, params: {id: organizer.to_param}, session: valid_session
        expect(response).to be_success
      end
    end

    describe "GET #new admin" do
      it "returns a success response" do
        get :new, params: {}, session: valid_session
        expect(response).to be_success
      end
    end

    describe "GET #edit admin" do
      it "redirects to the root path" do
        organizer = Organizer.create! valid_attributes
        get :edit, params: {id: organizer.to_param}, session: valid_session
        expect(response).to redirect_to(root_path)
      end
    end

    describe "POST #create admin" do
      context "with valid params" do
        it "creates a new Organizer" do
          expect {
            post :create, params: {organizer: valid_attributes}, session: valid_session
          }.to change(Organizer, :count).by(1)
        end

        it "redirects to the created organizer" do
          post :create, params: {organizer: valid_attributes}, session: valid_session
          expect(response).to redirect_to(Organizer.last)
        end
      end

      context "with invalid params" do
        it "returns a success response (i.e. to display the 'new' template)" do
          post :create, params: {organizer: invalid_attributes}, session: valid_session
          expect(response).to be_success
        end
      end
    end

    describe "PUT #update admin" do
      context "with valid params" do
        let(:new_attributes) {
          skip("Add a hash of attributes valid for your model")
        }

        it "redirects to the root path" do
          organizer = Organizer.create! valid_attributes
          put :update, params: {id: organizer.to_param, organizer: valid_attributes}, session: valid_session
          expect(response).to redirect_to(root_path)
        end
      end

      context "redirects to the root path" do
        it "returns a success response (i.e. to display the 'edit' template)" do
          organizer = Organizer.create! valid_attributes
          put :update, params: {id: organizer.to_param, organizer: invalid_attributes}, session: valid_session
          expect(response).to redirect_to(root_path)
        end
      end
    end

    describe "DELETE #destroy admin" do
      it "destroys the requested organizer" do
        organizer = Organizer.create! valid_attributes
        expect {
          delete :destroy, params: {id: organizer.to_param}, session: valid_session
        }.to change(Organizer, :count).by(-1)
      end

      it "redirects to the organizers list" do
        organizer = Organizer.create! valid_attributes
        delete :destroy, params: {id: organizer.to_param}, session: valid_session
        expect(response).to redirect_to(organizers_url)
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
      it "redirects to the root path" do
        organizer = Organizer.create! valid_attributes
        get :index, params: {}, session: valid_session
        expect(response).to redirect_to(root_path)
      end
    end

    describe "GET #show" do
      it "returns a success response" do
        organizer = Organizer.create! valid_attributes
        get :show, params: {id: organizer.to_param}, session: valid_session
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
      it "returns a success response" do
        organizer = Organizer.create! valid_attributes
        get :edit, params: {id: organizer.to_param}, session: valid_session
        expect(response).to be_success
      end
    end

    describe "POST #create" do
      context "with valid params" do

        it "redirects to the root path" do
          post :create, params: {organizer: valid_attributes}, session: valid_session
          expect(response).to redirect_to(root_path)
        end
      end

      context "with invalid params" do
        it "redirects to the root path" do
          post :create, params: {organizer: invalid_attributes}, session: valid_session
          expect(response).to redirect_to(root_path)
        end
      end
    end

    describe "PUT #update" do
      context "with valid params" do
        let(:new_attributes) {
          skip("Add a hash of attributes valid for your model")
        }

        it "updates the requested organizer" do
          organizer = Organizer.create! valid_attributes
          put :update, params: {id: organizer.to_param, organizer: new_attributes}, session: valid_session
          organizer.reload
          skip("Add assertions for updated state")
        end

        it "redirects to the organizer" do
          organizer = Organizer.create! valid_attributes
          put :update, params: {id: organizer.to_param, organizer: valid_attributes}, session: valid_session
          expect(response).to redirect_to(organizer)
        end
      end

      context "with invalid params" do
        it "returns a success response (i.e. to display the 'edit' template)" do
          organizer = Organizer.create! valid_attributes
          put :update, params: {id: organizer.to_param, organizer: invalid_attributes}, session: valid_session
          expect(response).to be_success
        end
      end
    end

    describe "DELETE #destroy organizer" do

      it "redirects to the root path" do
        organizer = Organizer.create! valid_attributes
        delete :destroy, params: {id: organizer.to_param}, session: valid_session
        expect(response).to redirect_to(root_path)
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

    describe "GET #index operator" do
      it "redirects to the root path" do
        organizer = Organizer.create! valid_attributes
        get :index, params: {}, session: valid_session
        expect(response).to redirect_to(root_path)
      end
    end

    describe "GET #show operator" do
      it "returns a success response" do
        organizer = Organizer.create! valid_attributes
        get :show, params: {id: organizer.to_param}, session: valid_session
        expect(response).to be_success
      end
    end

    describe "GET #new operator" do
      it "redirects to the root path" do
        get :new, params: {}, session: valid_session
        expect(response).to redirect_to(root_path)
      end
    end

    describe "GET #edit operator" do
      it "redirects to the root path" do
        organizer = Organizer.create! valid_attributes
        get :edit, params: {id: organizer.to_param}, session: valid_session
        expect(response).to redirect_to(root_path)
      end
    end

    describe "POST #create operator" do
      context "with valid params" do

        it "redirects to the root path" do
          post :create, params: {organizer: valid_attributes}, session: valid_session
          expect(response).to redirect_to(root_path)
        end
      end

      context "with invalid params" do
        it "redirects to the root path" do
          post :create, params: {organizer: invalid_attributes}, session: valid_session
          expect(response).to redirect_to(root_path)
        end
      end
    end

    describe "PUT #update operator" do
      context "with valid params" do
        it "redirects to the root path" do
          organizer = Organizer.create! valid_attributes
          put :update, params: {id: organizer.to_param, organizer: valid_attributes}, session: valid_session
          expect(response).to redirect_to(root_path)
        end
      end

      context "with invalid params" do
        it "redirects to the root path" do
          organizer = Organizer.create! valid_attributes
          put :update, params: {id: organizer.to_param, organizer: invalid_attributes}, session: valid_session
          expect(response).to redirect_to(root_path)
        end
      end
    end

    describe "DELETE #destroy operator" do

      it "redirects to the root path" do
        organizer = Organizer.create! valid_attributes
        delete :destroy, params: {id: organizer.to_param}, session: valid_session
        expect(response).to redirect_to(root_path)
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

    describe "GET #index doctor" do
      it "redirects to the root path" do
        organizer = Organizer.create! valid_attributes
        get :index, params: {}, session: valid_session
        expect(response).to redirect_to(root_path)
      end
    end

    describe "GET #show doctor" do
      it "returns a success response" do
        organizer = Organizer.create! valid_attributes
        get :show, params: {id: organizer.to_param}, session: valid_session
        expect(response).to be_success
      end
    end

    describe "GET #new doctor" do
      it "redirects to the root path" do
        get :new, params: {}, session: valid_session
        expect(response).to redirect_to(root_path)
      end
    end

    describe "GET #edit doctor" do
      it "redirects to the root path" do
        organizer = Organizer.create! valid_attributes
        get :edit, params: {id: organizer.to_param}, session: valid_session
        expect(response).to redirect_to(root_path)
      end
    end

    describe "POST #create doctor" do
      context "with valid params" do

        it "redirects to the root path" do
          post :create, params: {organizer: valid_attributes}, session: valid_session
          expect(response).to redirect_to(root_path)
        end
      end

      context "with invalid params" do
        it "redirects to the root path" do
          post :create, params: {organizer: invalid_attributes}, session: valid_session
          expect(response).to redirect_to(root_path)
        end
      end
    end

    describe "PUT #update doctor" do
      context "with valid params" do
        it "redirects to the root path" do
          organizer = Organizer.create! valid_attributes
          put :update, params: {id: organizer.to_param, organizer: valid_attributes}, session: valid_session
          expect(response).to redirect_to(root_path)
        end
      end

      context "with invalid params" do
        it "redirects to the root path" do
          organizer = Organizer.create! valid_attributes
          put :update, params: {id: organizer.to_param, organizer: invalid_attributes}, session: valid_session
          expect(response).to redirect_to(root_path)
        end
      end
    end

    describe "DELETE #destroy doctor" do

      it "redirects to the root path" do
        organizer = Organizer.create! valid_attributes
        delete :destroy, params: {id: organizer.to_param}, session: valid_session
        expect(response).to redirect_to(root_path)
      end
    end
  end

end

require 'rails_helper'

RSpec.describe DoctorsController, type: :controller do

  let(:valid_attributes) {
<<<<<<< HEAD
    FactoryBot.build(:doctor).attributes
  }

  let(:invalid_attributes) {
    FactoryBot.build(:doctor_invalid).attributes
=======

  }

  let(:invalid_attributes) {

>>>>>>> 9c1f502a3d1eecc8cbfb34bd06ebb614f46243ca
  }

  describe "doctor actions" do
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      doctor = FactoryBot.create(:doctor)
      sign_in doctor.user

    end


    def valid_session
      {"warden.user.user.key" => session["warden.user.user.key"]}
    end

    describe "GET #index from doctor" do
      it "redirects to the root path" do
        doctor = Doctor.create! valid_attributes
        get :index, params: {}, session: valid_session
        expect(response).to redirect_to(root_path)
      end
    end

    describe "GET #show from doctor" do
      it "returns a success response" do
        doctor = Doctor.create! valid_attributes
        get :show, params: {id: doctor.to_param}, session: valid_session
        expect(response).to be_success
      end
    end

    describe "GET #new from doctor" do
      it "redirects to the root path" do
        get :new, params: {}, session: valid_session
        expect(response).to redirect_to(root_path)
      end
    end

    describe "GET #edit from doctor" do
      it "returns a success response" do
        doctor = Doctor.create! valid_attributes
        get :edit, params: {id: doctor.to_param}, session: valid_session
        expect(response).to be_success
      end
    end

    describe "POST #create from doctor" do
      context "with valid params" do
        it "redirects to the root path" do
          post :create, params: {doctor: valid_attributes}, session: valid_session
          expect(response).to redirect_to(root_path)
        end
      end

      context "with invalid params" do
        it "redirects to the root path" do
          post :create, params: {doctor: invalid_attributes}, session: valid_session
          expect(response).to redirect_to(root_path)
        end
      end
    end

    describe "PUT #update from doctor" do
      context "with valid params" do
        let(:new_attributes) {
          skip("Add a hash of attributes valid for your model")
        }

        it "updates the requested doctor" do
          doctor = Doctor.create! valid_attributes
          put :update, params: {id: doctor.to_param, doctor: new_attributes}, session: valid_session
          skip("111")
        end

        it "redirects to the doctor" do
          doctor = Doctor.create! valid_attributes
          valid_session = {current_user: User.find(doctor.user_id)}
          put :update, params: {id: doctor.to_param, doctor: valid_attributes}, session: valid_session
          expect(response).to redirect_to(doctor)
        end
      end

      context "with invalid params" do
        it "returns a success response" do
          doctor = Doctor.create! valid_attributes
          put :update, params: {id: doctor.to_param, doctor: invalid_attributes}, session: valid_session
          expect(response).to be_success
        end
      end
    end

    describe "DELETE #destroy from doctor" do

      it "redirects to the root path" do
        doctor = Doctor.create! valid_attributes
        delete :destroy, params: {id: doctor.to_param}, session: valid_session
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

    describe "GET #index from organizer" do
      it "redirects to the root path" do
        doctor = Doctor.create! valid_attributes
        get :index, params: {}, session: valid_session
        expect(response).to redirect_to(root_path)
      end
    end

    describe "GET #show from organizer" do
      it "returns a success response" do
        doctor = Doctor.create! valid_attributes
        get :show, params: {id: doctor.to_param}, session: valid_session
        expect(response).to be_success
      end
    end

    describe "GET #new from organizer" do
      it "redirects to the root path" do
        get :new, params: {}, session: valid_session
        expect(response).to redirect_to(root_path)
      end
    end

    describe "GET #edit from organizer" do
      it "redirects to the root path" do
        doctor = Doctor.create! valid_attributes
        get :edit, params: {id: doctor.to_param}, session: valid_session
        expect(response).to redirect_to(root_path)
      end
    end

    describe "POST #create from organizer" do
      context "with valid params" do
        it "redirects to the root path" do
          post :create, params: {doctor: valid_attributes}, session: valid_session
          expect(response).to redirect_to(root_path)
        end
      end

      context "with invalid params" do
        it "redirects to the root path" do
          post :create, params: {doctor: invalid_attributes}, session: valid_session
          expect(response).to redirect_to(root_path)
        end
      end
    end

    describe "PUT #update from organizer" do
      context "with valid params" do
        let(:new_attributes) {
          skip("Add a hash of attributes valid for your model")
        }

        it "redirects to the root path" do
          doctor = Doctor.create! valid_attributes
          valid_session = {current_user: User.find(doctor.user_id)}
          put :update, params: {id: doctor.to_param, doctor: valid_attributes}, session: valid_session
          expect(response).to redirect_to(root_path)
        end
      end

      context "with invalid params" do
        it "redirects to the root path" do
          doctor = Doctor.create! valid_attributes
          put :update, params: {id: doctor.to_param, doctor: invalid_attributes}, session: valid_session
          expect(response).to redirect_to(root_path)
        end
      end
    end

    describe "DELETE #destroy from organizer" do

      it "redirects to the root path" do
        doctor = Doctor.create! valid_attributes
        delete :destroy, params: {id: doctor.to_param}, session: valid_session
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

    describe "GET #index from operator" do
      it "redirects to the root path" do
        doctor = Doctor.create! valid_attributes
        get :index, params: {}, session: valid_session
        expect(response).to redirect_to(root_path)
      end
    end

    describe "GET #show from operator" do
      it "redirects to the root path" do
        doctor = Doctor.create! valid_attributes
        get :show, params: {id: doctor.to_param}, session: valid_session
        expect(response).to redirect_to(root_path)
      end
    end

    describe "GET #new from operator" do
      it "redirects to the root path" do
        get :new, params: {}, session: valid_session
        expect(response).to redirect_to(root_path)
      end
    end

    describe "GET #edit from operator" do
      it "redirects to the root path" do
        doctor = Doctor.create! valid_attributes
        get :edit, params: {id: doctor.to_param}, session: valid_session
        expect(response).to redirect_to(root_path)
      end
    end

    describe "POST #create from operator" do
      context "with valid params" do
        it "redirects to the root path" do
          post :create, params: {doctor: valid_attributes}, session: valid_session
          expect(response).to redirect_to(root_path)
        end
      end

      context "with invalid params" do
        it "redirects to the root path" do
          post :create, params: {doctor: invalid_attributes}, session: valid_session
          expect(response).to redirect_to(root_path)
        end
      end
    end

    describe "PUT #update from operator" do
      context "with valid params" do
        let(:new_attributes) {
          skip("Add a hash of attributes valid for your model")
        }

        it "redirects to the root path" do
          doctor = Doctor.create! valid_attributes
          valid_session = {current_user: User.find(doctor.user_id)}
          put :update, params: {id: doctor.to_param, doctor: valid_attributes}, session: valid_session
          expect(response).to redirect_to(root_path)
        end
      end

      context "with invalid params" do
        it "redirects to the root path" do
          doctor = Doctor.create! valid_attributes
          put :update, params: {id: doctor.to_param, doctor: invalid_attributes}, session: valid_session
          expect(response).to redirect_to(root_path)
        end
      end
    end

    describe "DELETE #destroy from operator" do

      it "redirects to the root path" do
        doctor = Doctor.create! valid_attributes
        delete :destroy, params: {id: doctor.to_param}, session: valid_session
        expect(response).to redirect_to(root_path)
      end
    end

  end

  describe "admin actions" do

    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      admin = FactoryBot.create(:admin)
      sign_in admin
    end

    def valid_session
      {"warden.user.user.key" => session["warden.user.user.key"]}
    end

    describe "GET #index from admin" do
      it "returns a success response" do
        pp valid_attributes
        doctor = Doctor.create! valid_attributes
        get :index, params: {}, session: valid_session
        expect(response).to be_success
      end
    end

    describe "GET #show from admin" do
      it "returns a success response" do
        doctor = Doctor.create! valid_attributes
        get :show, params: {id: doctor.to_param}, session: valid_session
        expect(response).to be_success
      end
    end

    describe "GET #new from admin" do
      it "returns a success response" do
        get :new, params: {}, session: valid_session
        expect(response).to be_success
      end
    end

    describe "GET #edit from admin" do
      it "returns a success response" do
        doctor = Doctor.create! valid_attributes
        get :edit, params: {id: doctor.to_param}, session: valid_session
        expect(response).to redirect_to(root_path)
      end
    end

    describe "POST #create from admin" do
      context "with valid params" do
        it "creates a new Doctor" do
          expect {
            post :create, params: {doctor: valid_attributes}, session: valid_session
          }.to change(Doctor, :count).by(1)
        end

        it "redirects to the created doctor" do
          post :create, params: {doctor: valid_attributes}, session: valid_session
          expect(response).to redirect_to(Doctor.last)
        end
      end

      context "with invalid params" do
        it "returns a success response (i.e. to display the 'new' template)" do
          post :create, params: {doctor: invalid_attributes}, session: valid_session
          expect(response).to be_success
        end
      end
    end

    describe "PUT #update from admin" do
      context "with valid params" do
        let(:new_attributes) {
          skip("Add a hash of attributes valid for your model")
        }

        it "redirects to the doctor" do
          doctor = Doctor.create! valid_attributes
          valid_session = {current_user: User.find(doctor.user_id)}
          put :update, params: {id: doctor.to_param, doctor: valid_attributes}, session: valid_session
          expect(response).to redirect_to(root_path)
        end
      end

      context "with invalid params" do
        it "returns a success response (i.e. to display the 'edit' template)" do
          doctor = Doctor.create! valid_attributes
          put :update, params: {id: doctor.to_param, doctor: invalid_attributes}, session: valid_session
          expect(response).to redirect_to(root_path)
        end
      end
    end


    describe "DELETE #destroy from admin" do
      it "destroys the requested doctor" do
        doctor = Doctor.create! valid_attributes
        expect {
          delete :destroy, params: {id: doctor.to_param}, session: valid_session
        }.to change(Doctor, :count).by(-1)
      end

      it "redirects to the doctors list" do
        doctor = Doctor.create! valid_attributes
        delete :destroy, params: {id: doctor.to_param}, session: valid_session
        expect(response).to redirect_to(doctors_url)
      end
    end
  end
end

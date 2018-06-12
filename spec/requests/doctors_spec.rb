require 'rails_helper'

RSpec.describe "Doctors", type: :request do
  describe "GET /doctors" do

    let(:valid_attributes) {
      FactoryBot.build(:doctor).attributes
    }
  
    let(:invalid_attributes) {
      FactoryBot.build(:doctor_invalid).attributes
    }


    before(:each) do
      # post new_session_path, 
      admin = FactoryBot.create(:admin)
      @doctor = FactoryBot.create(:doctor)

      post user_session_path, params:{user: {login: admin.phone, password: admin.password } }
    end

    it "send list of doctors" do
      
      count_doctor = Doctor.count
      get doctors_path+".json"

      expect(response).to have_http_status(200)
      expect(json_body['doctors'].length).to eq(count_doctor)
    end
    
    it "create a doctor" do

      post doctors_path+".json", params:{doctor: FactoryBot.build(:doctor).attributes}
      expect(response).to have_http_status(201)
    end

    it "update a doctor" do

      doctor = Doctor.create! valid_attributes

      put doctor_path(doctor)+".json", params:{doctor: {first_name: "Kamil"}}

      expect(Doctor.find(doctor.id).first_name).to eq("Kamil")

    end

    it "show a doctor with" do 

      # post doctors_path+".json", params:{doctor: FactoryBot.build(:doctor).attributes}

      # expect(response).to have_http_status(201)
      doctor = Doctor.create! valid_attributes
      get doctor_path(doctor)+".json"
      expect(response).to be_success
      
    end


    it "destroy a doctor" do 

      doctor = Doctor.create! valid_attributes

      delete doctor_path(doctor)

      expected_doctor = Doctor.find_by_id(doctor.id)

      expect(expected_doctor).to eq(nil)
      
    end


  end
end

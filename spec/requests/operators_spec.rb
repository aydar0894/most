require 'rails_helper'

RSpec.describe "Operators", type: :request do

  let(:valid_attributes) {
    FactoryBot.build(:operator).attributes
  }

  let(:invalid_attributes) {
    FactoryBot.build(:operator_invalid).attributes
  }

  describe "GET /operators" do
    before(:each) do
      admin = FactoryBot.create(:admin)
      # FactoryBot.create(:operator)
      @operator = FactoryBot.create(:operator)
      post user_session_path, params:{user: {login: admin.phone, password: admin.password } }
    end
    
    it "send list of operator" do
      count_operator = Operator.count
      get operators_path+".json"
      expect(response).to have_http_status(200)
      expect(json_body['operators'].length).to eq(count_operator)
    end

    # it "create a operator" do
    #   post operators_path+".json", params:{operator: FactoryBot.build(:operator).attributes}
    #   expect(response).to have_http_status(201)
    # end

    it "update a operator" do
      operator = Operator.create! valid_attributes
      put operator_path(operator)+".json", params:{operator: {first_name: "Kamil"}}
      expect(Operator.find(operator.id).first_name).to eq("Kamil")

    end

    it "show a operator with" do 

      # post operators_path+".json", params:{operator: FactoryBot.build(:operator).attributes}

      # expect(response).to have_http_status(201)
      operator = Operator.create! valid_attributes
      get operator_path(operator)+".json"
      expect(response).to be_success
      
    end


    it "destroy a operator" do 

      operator = Operator.create! valid_attributes

      delete operator_path(operator)

      expected_operator = Operator.find_by_id(operator.id)

      expect(expected_operator).to eq(nil)
      
    end
    

  end
end

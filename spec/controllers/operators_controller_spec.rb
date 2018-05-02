require 'rails_helper'



RSpec.describe OperatorsController, type: :controller do

  let(:valid_attributes) {
    FactoryBot.build(:operator).attributes
  }

  let(:invalid_attributes) {
    FactoryBot.build(:operator_invalid).attributes
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # OperatorsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      operator = Operator.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      operator = Operator.create! valid_attributes
      get :show, params: {id: operator.to_param}, session: valid_session
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
      operator = Operator.create! valid_attributes
      get :edit, params: {id: operator.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Operator" do
        expect {
          post :create, params: {operator: valid_attributes}, session: valid_session
        }.to change(Operator, :count).by(1)
      end

      it "redirects to the created operator" do
        post :create, params: {operator: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Operator.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {operator: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested operator" do
        operator = Operator.create! valid_attributes
        put :update, params: {id: operator.to_param, operator: new_attributes}, session: valid_session
        operator.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the operator" do
        operator = Operator.create! valid_attributes
        put :update, params: {id: operator.to_param, operator: valid_attributes}, session: valid_session
        expect(response).to redirect_to(operator)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        operator = Operator.create! valid_attributes
        put :update, params: {id: operator.to_param, operator: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested operator" do
      operator = Operator.create! valid_attributes
      expect {
        delete :destroy, params: {id: operator.to_param}, session: valid_session
      }.to change(Operator, :count).by(-1)
    end

    it "redirects to the operators list" do
      operator = Operator.create! valid_attributes
      delete :destroy, params: {id: operator.to_param}, session: valid_session
      expect(response).to redirect_to(operators_url)
    end
  end

end

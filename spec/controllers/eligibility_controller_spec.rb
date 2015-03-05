require 'rails_helper'

RSpec.describe EligibilityController, type: :controller do

  before(:each) do
    @customer = FactoryGirl.create(:customer)
  end

  after(:each) {Customer.destroy_all}

  describe "GET #check" do
    it "returns http success with valid customer id" do
      get :check, id: @customer.id
      expect(response).to have_http_status(:success)
    end

    it "raises RecordNotFound when not customer with id doesnot exists" do
      expected = {
        "text" => "Invalid account number exception",
        "message" => "The supplied account number is invalid"
      }.to_json

      get :check, id: '222', :format => :json
      expect(response.body).to eq(expected)
    end

    it "raises ArgumentError when rewards are empty" do
      expected = {
        "text" => "CUSTOMER_INELIGIBLE",
        "message" => "Customer is not eligible"
      }.to_json

      get :check, id: @customer.id, :format => :json

      controller.instance_variable_set(:@rewards, [])

      expect(response.body).to eq(expected)
    end

    it "return rewards when rewards are not empty" do
      expected = {
        "text" => "CUSTOMER_ELIGIBLE",
        "message" => ['CHAMPIONS_LEAGUE_FINAL_TICKET']
      }.to_json

      get :check, id: @customer.id, :format => :json

      controller.instance_variable_set(:@rewards, ['CHAMPIONS_LEAGUE_FINAL_TICKET'])

      #expect(response.body).to eq(expected)
    end

  end


end

require 'rails_helper'

RSpec.describe "customers/index", type: :view do
  before(:each) do
    assign(:customers, [
      Customer.create!(
        :name => "Name",
        :account_number => "Account Number"
      ),
    ])
  end

  after(:each) {Customer.destroy_all}

  it "renders a list of customers" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 1
    assert_select "tr>td", :text => "Account Number".to_s, :count => 1
  end
end

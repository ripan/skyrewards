require 'rails_helper'

RSpec.describe "customers/new", type: :view do
  before(:each) do
    assign(:customer, Customer.new(
      :name => "MyString",
      :account_number => "MyString"
    ))
  end

  after(:each) {Customer.destroy_all}

  it "renders new customer form" do
    render

    assert_select "form[action=?][method=?]", customers_path, "post" do

      #assert_select "input#customer_name[name=?]", "customer[name]"

      #assert_select "input#customer_account_number[name=?]", "customer[account_number]"
    end
  end
end

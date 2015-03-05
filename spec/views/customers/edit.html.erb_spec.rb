require 'rails_helper'

RSpec.describe "customers/edit", type: :view do
  before(:each) do
    @customer = assign(:customer, Customer.create!(
      :name => "MyString",
      :account_number => "MyString"
    ))
  end

  after(:each) {Customer.destroy_all}

  it "renders the edit customer form" do
    render

    assert_select "form[action=?][method=?]", customer_path(@customer), "post" do

      #assert_select "input#customer_name[name=?]", "customer[name]"

      #assert_select "input#customer_account_number[account_number=?]", "customer[account_number]"
    end
  end
end

require 'rails_helper'

RSpec.describe "channels/index", type: :view do
  before(:each) do
    assign(:channels, [
      Channel.create!(
        :name => "Name"
      )
    ])
  end

  after(:each) {Channel.destroy_all}

  it "renders a list of channels" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 1
  end
end

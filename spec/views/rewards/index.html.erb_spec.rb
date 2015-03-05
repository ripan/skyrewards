require 'rails_helper'

RSpec.describe "rewards/index", type: :view do
  before(:each) do
    assign(:rewards, [
      Reward.create!(
        :name => 'Name'
      ),
    ])
  end

  after(:each) {Reward.destroy_all}

  it "renders a list of rewards" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 1
  end
end

require 'rails_helper'

RSpec.describe "rewards/show", type: :view do
  before(:each) do
    @reward = assign(:reward, Reward.create!(
      :name => "Name"
    ))
  end

  after(:each) {Reward.destroy_all}

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end

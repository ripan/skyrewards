require 'rails_helper'

RSpec.describe "rewards/edit", type: :view do
  before(:each) do
    @reward = assign(:reward, Reward.create!(
      :name => random_name
    ))
  end

  it "renders the edit reward form" do
    render

    assert_select "form[action=?][method=?]", reward_path(@reward), "post" do

      assert_select "input#reward_name[name=?]", "reward[name]"
    end
  end
end

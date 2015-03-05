require 'rails_helper'

RSpec.describe "channels/show", type: :view do
  before(:each) do
    @channel = assign(:channel, Channel.create!(
      :name => "Name"
    ))
  end

  after(:each) {Channel.destroy_all}

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end

require 'rails_helper'

RSpec.describe "rooms/show", type: :view do
  before(:each) do
    assign(:room, Room.create!(
      building: nil,
      name: "Name",
      cost: "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/9.99/)
  end
end

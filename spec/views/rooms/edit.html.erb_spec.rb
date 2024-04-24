require 'rails_helper'

RSpec.describe "rooms/edit", type: :view do
  let(:room) {
    Room.create!(
      building: nil,
      name: "MyString",
      cost: "9.99"
    )
  }

  before(:each) do
    assign(:room, room)
  end

  it "renders the edit room form" do
    render

    assert_select "form[action=?][method=?]", room_path(room), "post" do

      assert_select "input[name=?]", "room[building_id]"

      assert_select "input[name=?]", "room[name]"

      assert_select "input[name=?]", "room[cost]"
    end
  end
end

require 'rails_helper'

RSpec.describe "rooms/new", type: :view do
  before(:each) do
    assign(:room, Room.new(
      building: nil,
      name: "MyString",
      cost: "9.99"
    ))
  end

  it "renders new room form" do
    render

    assert_select "form[action=?][method=?]", rooms_path, "post" do

      assert_select "input[name=?]", "room[building_id]"

      assert_select "input[name=?]", "room[name]"

      assert_select "input[name=?]", "room[cost]"
    end
  end
end

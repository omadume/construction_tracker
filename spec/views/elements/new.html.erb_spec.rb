require 'rails_helper'

RSpec.describe "elements/new", type: :view do
  before(:each) do
    assign(:element, Element.new(
      room: nil,
      name: "MyString",
      cost: "9.99"
    ))
  end

  it "renders new element form" do
    render

    assert_select "form[action=?][method=?]", elements_path, "post" do

      assert_select "input[name=?]", "element[room_id]"

      assert_select "input[name=?]", "element[name]"

      assert_select "input[name=?]", "element[cost]"
    end
  end
end

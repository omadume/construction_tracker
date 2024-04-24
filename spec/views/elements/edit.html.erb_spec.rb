require 'rails_helper'

RSpec.describe "elements/edit", type: :view do
  let(:element) {
    Element.create!(
      room: nil,
      name: "MyString",
      cost: "9.99"
    )
  }

  before(:each) do
    assign(:element, element)
  end

  it "renders the edit element form" do
    render

    assert_select "form[action=?][method=?]", element_path(element), "post" do

      assert_select "input[name=?]", "element[room_id]"

      assert_select "input[name=?]", "element[name]"

      assert_select "input[name=?]", "element[cost]"
    end
  end
end

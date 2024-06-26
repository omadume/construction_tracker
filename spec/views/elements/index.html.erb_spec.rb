require 'rails_helper'

RSpec.describe "elements/index", type: :view do
  before(:each) do
    assign(:elements, [
      Element.create!(
        room: nil,
        name: "Name",
        cost: "9.99"
      ),
      Element.create!(
        room: nil,
        name: "Name",
        cost: "9.99"
      )
    ])
  end

  it "renders a list of elements" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("9.99".to_s), count: 2
  end
end

require 'rails_helper'

RSpec.describe "buildings/index", type: :view do
  before(:each) do
    assign(:buildings, [
      Building.create!(
        name: "Name",
        budget: "9.99",
        total_expenditure: "9.99"
      ),
      Building.create!(
        name: "Name",
        budget: "9.99",
        total_expenditure: "9.99"
      )
    ])
  end

  it "renders a list of buildings" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("9.99".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("9.99".to_s), count: 2
  end
end

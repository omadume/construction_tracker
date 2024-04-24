require 'rails_helper'

RSpec.describe "daily_snapshots/index", type: :view do
  before(:each) do
    assign(:daily_snapshots, [
      DailySnapshot.create!(
        building: nil,
        total_expenditure: "9.99"
      ),
      DailySnapshot.create!(
        building: nil,
        total_expenditure: "9.99"
      )
    ])
  end

  it "renders a list of daily_snapshots" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("9.99".to_s), count: 2
  end
end

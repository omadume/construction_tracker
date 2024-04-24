require 'rails_helper'

RSpec.describe "daily_snapshots/new", type: :view do
  before(:each) do
    assign(:daily_snapshot, DailySnapshot.new(
      building: nil,
      total_expenditure: "9.99"
    ))
  end

  it "renders new daily_snapshot form" do
    render

    assert_select "form[action=?][method=?]", daily_snapshots_path, "post" do

      assert_select "input[name=?]", "daily_snapshot[building_id]"

      assert_select "input[name=?]", "daily_snapshot[total_expenditure]"
    end
  end
end

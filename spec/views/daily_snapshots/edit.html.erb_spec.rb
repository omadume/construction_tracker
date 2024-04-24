require 'rails_helper'

RSpec.describe "daily_snapshots/edit", type: :view do
  let(:daily_snapshot) {
    DailySnapshot.create!(
      building: nil,
      total_expenditure: "9.99"
    )
  }

  before(:each) do
    assign(:daily_snapshot, daily_snapshot)
  end

  it "renders the edit daily_snapshot form" do
    render

    assert_select "form[action=?][method=?]", daily_snapshot_path(daily_snapshot), "post" do

      assert_select "input[name=?]", "daily_snapshot[building_id]"

      assert_select "input[name=?]", "daily_snapshot[total_expenditure]"
    end
  end
end

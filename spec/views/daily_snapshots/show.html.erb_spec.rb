require 'rails_helper'

RSpec.describe "daily_snapshots/show", type: :view do
  before(:each) do
    assign(:daily_snapshot, DailySnapshot.create!(
      building: nil,
      total_expenditure: "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/9.99/)
  end
end

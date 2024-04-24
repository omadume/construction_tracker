require 'rails_helper'

RSpec.describe "buildings/show", type: :view do
  before(:each) do
    assign(:building, Building.create!(
      name: "Name",
      budget: "9.99",
      total_expenditure: "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
  end
end

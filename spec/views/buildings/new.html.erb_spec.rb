require 'rails_helper'

RSpec.describe "buildings/new", type: :view do
  before(:each) do
    assign(:building, Building.new(
      name: "MyString",
      budget: "9.99",
      total_expenditure: "9.99"
    ))
  end

  it "renders new building form" do
    render

    assert_select "form[action=?][method=?]", buildings_path, "post" do

      assert_select "input[name=?]", "building[name]"

      assert_select "input[name=?]", "building[budget]"

      assert_select "input[name=?]", "building[total_expenditure]"
    end
  end
end

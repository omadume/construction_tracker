require 'rails_helper'

RSpec.describe "elements/show", type: :view do
  before(:each) do
    assign(:element, Element.create!(
      room: nil,
      name: "Name",
      cost: "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/9.99/)
  end
end

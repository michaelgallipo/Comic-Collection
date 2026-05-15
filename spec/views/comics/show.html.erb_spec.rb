require 'rails_helper'

RSpec.describe "comics/show", type: :view do
  before(:each) do
    assign(:comic, Comic.create!(
      title: "Title",
      issue_number: "9.99",
      legacy_issue: "9.99",
      cover_variant: "Cover Variant",
      publisher: "Publisher",
      cost: "9.99",
      box: "Box",
      comments: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/Cover Variant/)
    expect(rendered).to match(/Publisher/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/Box/)
    expect(rendered).to match(/MyText/)
  end
end

require 'rails_helper'

RSpec.describe "comics/index", type: :view do
  before(:each) do
    assign(:comics, [
      Comic.create!(
        title: "Title",
        issue_number: "9.99",
        legacy_issue: "9.99",
        cover_variant: "Cover Variant",
        publisher: "Publisher",
        cost: "9.99",
        box: "Box",
        comments: "MyText"
      ),
      Comic.create!(
        title: "Title",
        issue_number: "9.99",
        legacy_issue: "9.99",
        cover_variant: "Cover Variant",
        publisher: "Publisher",
        cost: "9.99",
        box: "Box",
        comments: "MyText"
      )
    ])
  end

  it "renders a list of comics" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Title".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("9.99".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("9.99".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Cover Variant".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Publisher".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("9.99".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Box".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
  end
end

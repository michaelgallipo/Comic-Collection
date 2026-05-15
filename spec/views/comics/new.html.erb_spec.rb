require 'rails_helper'

RSpec.describe "comics/new", type: :view do
  before(:each) do
    assign(:comic, Comic.new(
      title: "MyString",
      issue_number: "9.99",
      legacy_issue: "9.99",
      cover_variant: "MyString",
      publisher: "MyString",
      cost: "9.99",
      box: "MyString",
      comments: "MyText"
    ))
  end

  it "renders new comic form" do
    render

    assert_select "form[action=?][method=?]", comics_path, "post" do

      assert_select "input[name=?]", "comic[title]"

      assert_select "input[name=?]", "comic[issue_number]"

      assert_select "input[name=?]", "comic[legacy_issue]"

      assert_select "input[name=?]", "comic[cover_variant]"

      assert_select "input[name=?]", "comic[publisher]"

      assert_select "input[name=?]", "comic[cost]"

      assert_select "input[name=?]", "comic[box]"

      assert_select "textarea[name=?]", "comic[comments]"
    end
  end
end

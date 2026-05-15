# == Schema Information
#
# Table name: comics
#
#  id            :bigint           not null, primary key
#  box           :string
#  comments      :text
#  cost          :decimal(5, 2)
#  cover_variant :string
#  issue_number  :decimal(5, 1)
#  legacy_issue  :decimal(5, 1)
#  publisher     :string
#  purchase_date :date
#  title         :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
require 'rails_helper'

RSpec.describe Comic, type: :model do
  describe "#formatted_issue" do
    it "returns issue number without decimal if it's a whole number" do
      comic = Comic.new(issue_number: 5.0)
      expect(comic.formatted_issue).to eq("5")
    end

    it "returns issue number with decimal if it's not a whole number" do
      comic = Comic.new(issue_number: 5.1)
      expect(comic.formatted_issue).to eq("5.1")
    end

    it "returns empty string if issue number is nil" do
      comic = Comic.new(issue_number: nil)
      expect(comic.formatted_issue).to eq("")
    end
  end

  describe "#formatted_legacy" do
    it "returns legacy issue without decimal if it's a whole number" do
      comic = Comic.new(legacy_issue: 10.0)
      expect(comic.formatted_legacy).to eq("10")
    end

    it "returns legacy issue with decimal if it's not a whole number" do
      comic = Comic.new(legacy_issue: 10.5)
      expect(comic.formatted_legacy).to eq("10.5")
    end

    it "returns empty string if legacy issue is nil" do
      comic = Comic.new(legacy_issue: nil)
      expect(comic.formatted_legacy).to eq("")
    end
  end
end

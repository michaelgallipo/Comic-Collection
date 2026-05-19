# == Schema Information
#
# Table name: comics
#
#  id            :bigint           not null, primary key
#  box           :string
#  comments      :text
#  copies        :integer
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
class Comic < ApplicationRecord
  def formatted_issue
    if issue_number && issue_number % 1 == 0
      issue_number.to_i.to_s
    else
      issue_number.to_s
    end
  end

  def formatted_legacy
    if legacy_issue && legacy_issue % 1 == 0
      legacy_issue.to_i.to_s
    else
      legacy_issue.to_s
    end
  end
end

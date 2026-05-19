json.extract! comic, :id, :title, :issue_number, :legacy_issue, :cover_variant, :publisher, :copies, :purchase_date, :cost, :box, :comments, :created_at, :updated_at
json.url comic_url(comic, format: :json)

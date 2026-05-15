class CreateComics < ActiveRecord::Migration[8.1]
  def change
    create_table :comics do |t|
      t.string :title
      t.decimal :issue_number, precision: 5, scale: 1
      t.decimal :legacy_issue, precision: 5, scale: 1
      t.string :cover_variant
      t.string :publisher
      t.date :purchase_date
      t.decimal :cost, precision: 5, scale: 2
      t.string :box
      t.text :comments

      t.timestamps
    end
  end
end

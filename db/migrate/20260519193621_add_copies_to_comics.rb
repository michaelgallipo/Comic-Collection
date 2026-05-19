class AddCopiesToComics < ActiveRecord::Migration[8.1]
  def change
    add_column :comics, :copies, :integer
  end
end

class SetDefaultCopiesOnComics < ActiveRecord::Migration[8.1]
  def up
    change_column_default :comics, :copies, 1
  end

  def down
    change_column_default :comics, :copies, nil
  end
end

class ChangeTableListsAgainAgain < ActiveRecord::Migration[5.1]
  def change
    add_column :lists, :item_id, :integer
  end
end

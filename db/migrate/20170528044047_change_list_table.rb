class ChangeListTable < ActiveRecord::Migration[5.1]
  def change
    change_column(:lists, :type, :string, limit: 80)
  end
end

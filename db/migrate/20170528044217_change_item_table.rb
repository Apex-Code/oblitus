class ChangeItemTable < ActiveRecord::Migration[5.1]
  def change
    change_column(:items, :name, :string, limit: 80)
  end
end

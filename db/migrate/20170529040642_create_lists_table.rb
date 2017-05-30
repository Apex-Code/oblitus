class CreateListsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :lists do |t|
      t.string :name
      t.string :list_type
      t.integer :item_id
      t.timestamps null: false
    end
  end
end

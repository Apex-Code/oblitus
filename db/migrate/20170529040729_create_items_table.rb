class CreateItemsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :content
      t.timestamps null: false
    end
  end
end

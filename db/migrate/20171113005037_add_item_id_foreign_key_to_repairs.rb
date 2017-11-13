class AddItemIdForeignKeyToRepairs < ActiveRecord::Migration[5.0]
  def change
    add_column :repairs, :item_id, :integer
    add_foreign_key :repairs, :items
  end
end

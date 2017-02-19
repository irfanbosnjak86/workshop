class CreateRepairs < ActiveRecord::Migration[5.0]
  def change
    create_table :repairs do |t|
      t.string :title
      t.text :malfunction_desc
      t.text :repair_desc
      t.datetime :repair_date
      t.string :status
      t.decimal :price, :precision => 8, :scale => 2

      t.timestamps
    end
  end
end

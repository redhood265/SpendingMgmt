class CreateBuyItems < ActiveRecord::Migration[5.2]
  def change
    create_table :buy_items do |t|
      t.integer :category_id
      t.string :name
      t.integer :price
      t.boolean :approval

      t.timestamps
    end
  end
end

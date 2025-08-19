class CreatePieces < ActiveRecord::Migration[7.1]
  def change
    create_table :pieces do |t|
      t.string :clothing_category
      t.string :name
      t.text :description
      t.integer :price
      t.string :brand
      t.string :shop_url

      t.timestamps
    end
  end
end

class CreatePieces < ActiveRecord::Migration[7.1]
  def change
    create_table :pieces do |t|
      t.string :clothing_category
      t.string :piece_name
      t.string :piece_description
      t.float :price
      t.string :brand
      t.string :e_com_url
      t.string :image_url
      t.references :look, null: false, foreign_key: true

      t.timestamps
    end
  end
end

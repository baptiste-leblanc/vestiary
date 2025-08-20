class CreateLookPieces < ActiveRecord::Migration[7.1]
  def change
    create_table :look_pieces do |t|
      t.references :look, null: false, foreign_key: true
      t.references :piece, null: false, foreign_key: true

      t.timestamps
    end
  end
end

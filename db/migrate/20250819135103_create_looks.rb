class CreateLooks < ActiveRecord::Migration[7.1]
  def change
    create_table :looks do |t|
      t.text :description
      t.string :name
      t.references :context, null: false, foreign_key: true

      t.timestamps
    end
  end
end

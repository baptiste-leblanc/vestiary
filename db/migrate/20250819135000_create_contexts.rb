class CreateContexts < ActiveRecord::Migration[7.1]
  def change
    create_table :contexts do |t|
      t.string :objective
      t.string :request_name
      t.string :budget
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

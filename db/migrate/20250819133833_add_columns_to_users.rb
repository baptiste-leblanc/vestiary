class AddColumnsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :username, :string
    add_column :users, :weight, :float
    add_column :users, :height, :float
    add_column :users, :gender, :string
    add_column :users, :morphology, :string
  end
end

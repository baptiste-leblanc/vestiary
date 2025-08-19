class DeleteColumnPasswordMail < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :password, :string
    remove_column :users, :mail, :string
  end
end

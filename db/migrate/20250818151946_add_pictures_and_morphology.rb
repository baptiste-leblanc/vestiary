class AddPicturesAndMorphology < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :pictures, :string, array: true, default: []
    add_column :users, :morphology_desc, :string
  end
end

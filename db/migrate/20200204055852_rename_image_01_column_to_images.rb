class RenameImage01ColumnToImages < ActiveRecord::Migration[5.2]
  def change
    rename_column :images, :image_01, :image_one
  end
end

class RenameImageOneColumnToImages < ActiveRecord::Migration[5.2]
  def change
    rename_column :images, :image_one, :image
  end
end

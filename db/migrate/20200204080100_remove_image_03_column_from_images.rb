class RemoveImage03ColumnFromImages < ActiveRecord::Migration[5.2]
  def change
    remove_column :images, :image_03, :text

  end
end

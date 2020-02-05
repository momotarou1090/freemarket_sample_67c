class RemoveImage02ColumnFromImages < ActiveRecord::Migration[5.2]
  def change
    remove_column :images, :image_02, :text
  end
end

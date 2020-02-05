class RemoveImage04ColumnFromImages < ActiveRecord::Migration[5.2]
  def change
    remove_column :images, :image_04, :text
  end
end

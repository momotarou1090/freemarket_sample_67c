class RemoveColumnFromImages < ActiveRecord::Migration[5.2]
  def change
    remove_column :images, :image_02, :text
    remove_column :images, :image_03, :text
    remove_column :images, :image_04, :text
    remove_column :images, :image_05, :text
  end
end

class AddImage02ToImages < ActiveRecord::Migration[5.2]
  def change
    add_column :images, :image_02, :text
  end
end

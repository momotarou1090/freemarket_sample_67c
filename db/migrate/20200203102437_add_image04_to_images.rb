class AddImage04ToImages < ActiveRecord::Migration[5.2]
  def change
    add_column :images, :image_04, :text
  end
end

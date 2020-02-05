class AddImage03ToImages < ActiveRecord::Migration[5.2]
  def change
    add_column :images, :image_03, :text
  end
end

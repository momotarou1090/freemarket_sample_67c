class AddImage05ToImages < ActiveRecord::Migration[5.2]
  def change
    add_column :images, :image_05, :text
  end
end

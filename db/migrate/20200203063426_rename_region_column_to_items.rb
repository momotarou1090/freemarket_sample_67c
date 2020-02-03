class RenameRegionColumnToItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :region, :region_id
  end
end

class RenameConditionColumnsToItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :condition, :condition_id
    rename_column :items, :postage, :postage_id
    rename_column :items, :shipping_date, :shipping_date_id
  end
end

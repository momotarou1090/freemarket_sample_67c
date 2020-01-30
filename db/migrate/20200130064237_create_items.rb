class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      # t.string :name, null: false
      # t.integer :price, null: false
      # t.string :condition, null: false
      # t.string :postage, null: false
      # t.string :region, null: false
      # t.string :shipping_date, null: false
      # t.text :description, null:false
      # t.integer :seller_id, null: false
      # t.integer :buyer_id
      # t.references :brand_id, foreign_key: true
      # t.string :status, null:false

      t.timestamps
    end
  end
end

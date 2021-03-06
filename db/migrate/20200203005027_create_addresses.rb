class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :post_code,       null: false
      t.string  :prefecture,      null: false
      t.string  :city,            null: false
      t.string  :block,           null: false
      t.string  :building,        null: false
      t.string  :last_name,       null: false
      t.string  :first_name,      null: false
      t.string  :last_name_kana,  null: false
      t.string  :first_name_kana, null: false
      t.string  :phone_number,    null: false
      t.references :user,                          foreign_key: true
      t.timestamps
    end
  end
end

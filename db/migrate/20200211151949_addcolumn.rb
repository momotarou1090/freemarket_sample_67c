class Addcolumn < ActiveRecord::Migration[5.2]
  def change

      add_column   :items, :seller_id, :bigint,index: true
      add_column   :items, :buyer_id,:bigint,index: true
      add_foreign_key :items, :users, column: :seller_id
      add_foreign_key :items, :users, column: :buyer_id
      

  end
end

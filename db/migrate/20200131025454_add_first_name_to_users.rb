class AddFirstNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name_kana, :string, :null => false
  end
end

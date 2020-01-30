class AddLastNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :last_name, :string, :null => false
    add_column :users, :first_name, :string, :null => false
    add_column :users, :birth_year, :integer, :null => false
    add_column :users, :birth_month, :string, :null => false
    add_column :users, :birth_date, :string, :null => false
    add_column :users, :phone_number, :string, :null => false
    add_index :users, :nickname
  end
end

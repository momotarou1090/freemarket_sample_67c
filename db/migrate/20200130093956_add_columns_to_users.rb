class AddLastNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :last_name, :string
    add_column :users, :first_name, :string
    add_column :users, :birth_year, :integer
    add_column :users, :birth_month, :string
    add_column :users, :birth_date, :string
    add_column :users, :phone_number, :string
    add_index :users, :nickname
  end
end

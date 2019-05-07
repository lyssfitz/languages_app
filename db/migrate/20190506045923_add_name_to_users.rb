class AddNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :role, :integer
    add_column :users, :date_of_birth, :date
    add_column :users, :gender, :integer
    add_column :users, :biography, :text
    add_column :users, :city, :string
  end
end

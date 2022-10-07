class AddAddyToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :address1, :string
    add_column :users, :city, :string
    add_column :users, :state_code, :string
    add_column :users, :zipcode, :string
  end
end

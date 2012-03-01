class AddRememberTokenToVendors < ActiveRecord::Migration
  def change
    add_column :vendors, :remember_token, :string
    add_index :vendors, :remember_token
  end
end

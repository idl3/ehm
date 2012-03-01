class AddIndexToVendorsUsername < ActiveRecord::Migration
  def change
    add_index :vendors, :username, unique: true
    add_index :vendors, :email, unique: true
  end
end

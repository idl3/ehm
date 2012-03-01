class AddIndexToVendorsUsername < ActiveRecord::Migration
  def change
    add_index :vendors, :username, unique: true
  end
end

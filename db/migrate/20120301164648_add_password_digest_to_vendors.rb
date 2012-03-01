class AddPasswordDigestToVendors < ActiveRecord::Migration
  def change
    add_column :vendors, :password_digest, :string
  end
end

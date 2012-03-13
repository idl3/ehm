class CreateCitiesVendors < ActiveRecord::Migration
  def change
    create_table :cities_vendors, id: false do |t|
      t.integer :city_id
      t.integer :vendor_id
    end
  end
end

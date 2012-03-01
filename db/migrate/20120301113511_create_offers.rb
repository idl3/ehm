class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.string :title
      t.decimal :price
      t.integer :vendor_id
      t.timestamps
    end
  end
end

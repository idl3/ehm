class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.string :title
      t.decimal :price, :precision => 5, :scale => 2
      t.integer :vendor_id
      t.timestamps
    end
  end
end

class AddInitialPriceToOffers < ActiveRecord::Migration
  def change
    add_column :offers, :initial_price, :decimal, :precision => 5, :scale => 2

  end
end

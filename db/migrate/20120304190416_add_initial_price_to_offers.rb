class AddInitialPriceToOffers < ActiveRecord::Migration
  def change
    add_column :offers, :initial_price, :decimal

  end
end

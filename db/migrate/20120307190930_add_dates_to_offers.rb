class AddDatesToOffers < ActiveRecord::Migration
  def change
    add_column :offers, :starts_on, :date
    add_column :offers, :expires_on, :date
  end
end

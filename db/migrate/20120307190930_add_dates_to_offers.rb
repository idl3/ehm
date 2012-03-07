class AddDatesToOffers < ActiveRecord::Migration
  def change
    add_column :offers, :starts_at, :date

    add_column :offers, :expires_at, :date

  end
end

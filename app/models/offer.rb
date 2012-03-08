class Offer < ActiveRecord::Base
  attr_accessible :title, :price, :initial_price, :starts_on, :expires_on
  belongs_to :vendor

  validates :vendor_id, presence: true
  validates :title, presence: true, length: { minimum: 6, maximum: 25 }
  validates :initial_price, presence: true, numericality: true, length: { maximum: 6 }
  validates :price, presence: true, numericality: { less_than: :initial_price }, length: { maximum: 6 }
  validates :starts_on, presence: true, date: { after: Date.current.prev_year, message: "Can't be yesterday" }
  validates :expires_on, presence:true, date: { after: :starts_on, message: "Must be after the starting date" }

  def self.running_now
    Offer.where("starts_on <= ? AND expires_on >= ?", Date.current, Date.current);
  end

  def self.expiring_soon
    Offer.running_now.where("expires_on = ?", Date.current.tomorrow)
  end
end
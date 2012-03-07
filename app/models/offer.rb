class Offer < ActiveRecord::Base
  attr_accessible :title, :price, :initial_price, :starts_at, :expires_at
  belongs_to :vendor

  validates :vendor_id, presence: true
  validates :title, presence: true, length: { minimum: 6, maximum: 25 }
  validates :initial_price, presence: true, numericality: true, length: { maximum: 6 }
  validates :price, presence: true, numericality: { less_than: :initial_price }, length: { maximum: 6 }
  validates :starts_at, presence: true, date: { after: Date.yesterday, message: "Can't be yesterday" }
  validates :expires_at, presence:true, date: { after: :starts_at, message: "Must be after the starting date" }

  default_scope order: 'created_at DESC'
end
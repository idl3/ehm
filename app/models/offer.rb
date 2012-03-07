class Offer < ActiveRecord::Base
  attr_accessible :title, :price, :initial_price
  belongs_to :vendor

  validates :vendor_id, presence: true
  validates :title, presence: true, length: { minimum: 6, maximum: 25 }
  validates :initial_price, presence: true, numericality: true, length: { maximum: 6 }
  validates :price, presence: true, numericality: { less_than: :initial_price }, length: { maximum: 6 }

  default_scope order: 'created_at DESC'
end
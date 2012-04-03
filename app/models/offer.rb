class Offer < ActiveRecord::Base
  attr_accessible :title, :price, :initial_price, :starts_on, :expires_on, :image, :category_id

  belongs_to :vendor
  belongs_to :category

  has_attached_file :image, styles: { thumb: '150x150>', normal: '250x250>' }, :storage => :s3,
    :bucket =>  'shoply',
    :s3_credentials => {
      :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
      :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
    }

  validates :vendor_id, presence: true
  validates :category_id, presence: true
  validates :title, presence: true, length: { minimum: 6, maximum: 60 }
  validates :initial_price, presence: true, numericality: true, length: { maximum: 6 }
  validates :price, presence: true, numericality: { less_than: :initial_price }, length: { maximum: 6 }
  validates :starts_on, presence: true, date: { after: Date.current.prev_year, message: "Too old!" }
  validates :expires_on, presence: true, date: { after: :starts_on, message: "Must be after the starting date" }

  default_scope where("starts_on <= ? AND expires_on >= ?", Date.current, Date.current).limit(12)

  self.per_page = 12

  def self.expiring_soon
    Offer.where("expires_on = ? OR expires_on = ?", Date.current, Date.current.tomorrow)
  end
end
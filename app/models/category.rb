class Category < ActiveRecord::Base
  attr_accessible :title

  has_many :offers

  validates :title, presence: true, length: { maximum: 30 }
end

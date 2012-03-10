class Category < ActiveRecord::Base
  has_many :offers

  validates :title, presence: true
end

class Vendor < ActiveRecord::Base
  attr_accessible :name, :username, :email, :password, :password_confirmation

  has_many :offers, dependent: :destroy
  has_many :categories, through: :offers, uniq: true
  has_and_belongs_to_many :cities, uniq: true

  has_secure_password
end
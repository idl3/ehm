class Vendor < ActiveRecord::Base
  attr_accessible :name, :username, :email, :password, :password_confirmation
  has_many :offers, dependent: :destroy
  has_many :categories, through: :offers, uniq: true
  has_secure_password

  def to_param
    username
  end
end
class Vendor < ActiveRecord::Base
  attr_accessible :name, :username, :email, :password, :password_confirmation
  has_many :offers, dependent: :destroy
  has_secure_password

  def to_param
    username
  end

  private
  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
end
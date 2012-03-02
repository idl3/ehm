class Vendor < ActiveRecord::Base
  attr_accessible :name, :username, :email, :password, :password_confirmation
  before_save :create_remember_token
  has_secure_password

  validates :name,      presence: true, length: { maximum: 20 }
  validates :username,  presence: true
  validates :email,     presence: true
  validates :password,  presence: true
  validates :password_confirmation, presence: true

  has_many :offers, dependent: :destroy

  def to_param
    username
  end

  private

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
end
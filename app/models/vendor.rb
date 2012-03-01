class Vendor < ActiveRecord::Base
  has_many :offers

  def to_param
    self.username
  end
end

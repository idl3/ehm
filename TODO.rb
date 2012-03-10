# implement domain logic
class Offer < ActiveRecord::Base
  belongs_to :vendor
  belongs_to :category
end

class Vendor < ActiveRecord::Base
  has_many :offers
  has_many :categories, :through => :offers
end

class Category < ActiveRecord::Base
  has_many :offers
  has_many :vendors, :through => :offers
end

# think: ASSIGN CITIES TO VENDORS AND REFINE-BY CITIES?

# When all Vendors are listed = prepei na yparxei diaspora, dhladh na fianontai oloi oi Vendors
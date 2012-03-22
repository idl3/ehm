# encoding: utf-8

def format_price(price)
  price = price.to_s
  if price =~ /\./
    raw price.gsub('.', '<span class="smaller">,') + '€</span>' # => take this to database level (localization)
  else
    raw price + '<span class="smaller>€</span>'
  end
end
# encoding: utf-8

module OfferHelper
  def discount(price, initial_price)
    '25%' # work it out
  end

  def win(price, initial_price)
    (initial_price - price).to_s.gsub('.', ',') + '€'
  end

  def format_price(price)
    price = sprintf("%5.2f", price)
    if price =~ /\./
      raw price.gsub('.', '<span class="smaller">,') + '€</span>' # => take this to database level (localization)
    else
      raw price + '<span class="smaller>€</span>'
    end
  end

  def discount(discount)
    discount.to_s + '%'
  end
end
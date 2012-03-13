# encoding: utf-8

namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    Rake::Task['db:reset'].invoke
    make_vendors(5)
    make_offers(5)

  end
end

def make_vendors(qty)
  qty.times do |n|
    name  = "Αλυσίδα #{n+1}"
    email = "vendor-#{n+1}@app.com"
    username = name.parameterize
    password  = "tetete"
    vendor = Vendor.new(name:   name,
                 email:    email,
                 username: username,
                 password: password,
                 password_confirmation: password)
    vendor.save!
  end
end

def make_offers(qty)
  Vendor.all.each do |vendor|
    qty.times do |n|
      offer = vendor.offers.build
      offer.title = "Προσφορά #{n+1}"
      offer.price = 15.50
      offer.initial_price = 16.50
      offer.starts_on = Date.current.yesterday
      offer.expires_on = Date.current + n
      offer.category = Category.find(n+1)
      offer.save!
    end
  end
end


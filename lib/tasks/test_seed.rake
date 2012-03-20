# encoding: utf-8

namespace :db do
  namespace :test do
    task :prepare => :environment do
      Rake::Task["db:seed"].invoke
      make_vendors(10)
      make_offers_for_each_vendor(10)
      connect_vendors_to_cities
    end
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

def make_offers_for_each_vendor(qty)
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

def connect_vendors_to_cities
  Vendor.count.times do |n|
    Vendor.find(n+1).cities<<[City.find(n+1),City.find(n+2)]
  end
end
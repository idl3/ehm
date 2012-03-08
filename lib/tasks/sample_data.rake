namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    Rake::Task['db:reset'].invoke
    make_vendors(10)
    make_offers(5)

  end
end

def make_vendors(qty)
  qty.times do |n|
    name  = "Vendor no. #{n+1}"
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
      offer.title = "Offer no.#{n+1}"
      offer.price = 15.50
      offer.initial_price = 16.50
      offer.starts_on = Date.today + n
      offer.expires_on = Date.tomorrow + n

      offer.save!
    end
  end
end


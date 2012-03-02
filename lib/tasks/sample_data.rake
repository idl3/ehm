namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    Rake::Task['db:reset'].invoke
    make_vendors
  end
end

def make_vendors
  10.times do |n|
    name  = "Vendor no. #{n+1}"
    email = "vendor-#{n+1}@app.com"
    username = name.parameterize
    password  = "tetete"
    vendor = Vendor.new(name:   name,
                 email:    email,
                 username: username,
                 password: password,
                 password_confirmation: password)

    10.times do |o|
      title = Faker::Name.name
      price = o + 15.50
      vendor.offers.build(title: title, price: price)
    end
    vendor.save!
  end
end


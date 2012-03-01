namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    Rake::Task['db:reset'].invoke
    make_vendors
  end
end

def make_vendors
  10.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    username = name.parameterize
    password  = "password"
    Vendor.create!(name:   name,
                 email:    email,
                 username: username,
                 password: password,
                 password_confirmation: password)
  end
end
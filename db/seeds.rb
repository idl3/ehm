# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

v1 = Vendor.create name: 'Masoutis A.E.',      username: 'masoutis'
v2 = Vendor.create name: 'A.B. Basilopoulos',  username: 'basilopoulos'
v3 = Vendor.create name: 'Carrefour O.E.',     username: 'carrefour'
v4 = Vendor.create name: 'Arvanitidhs',        username: 'arvanitidis'

o1 = Offer.new title: 'Gala Agno',          price: 15.50
o2 = Offer.new title: 'Ladi Minerva',       price: 13.25
o3 = Offer.new title: 'Dimitriaka Kellogs', price: 15.98

v1.offers << o1
v1.offers << o2
v1.offers << o3

v2.offers << o2
v2.offers << o3

v3.offers << o3


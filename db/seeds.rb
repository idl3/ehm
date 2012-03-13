# encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.create(title: 'Αλλαντικά')
Category.create(title: 'Κρεατικά')
Category.create(title: 'Χυμοί - Αναψυκτικά')
Category.create(title: 'Γλυκά')
Category.create(title: 'Είδη περιποίησης')

City.create(name: 'Αθήνα')
City.create(name: 'Θεσσαλονίκη')
City.create(name: 'Ηράκλειο')
City.create(name: 'Σέρρες')
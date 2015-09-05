# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.create(sku: '323167', description: 'Red-bristle toothbrush', price: 0.50, color: 'Red')
Product.create(sku: '323168', description: 'Blue-bristle toothbrush', price: 0.50, color: 'Blue')
Product.create(sku: '323169', description: 'Yellow-bristle toothbrush', price: 0.50, color: 'Yellow')
Product.create(sku: '413776', description: 'Mint-flavored toothpaste', price: 0.50, flavor: 'Mint')
Product.create(sku: '413777', description: 'Cherry-flavored toothpaste', price: 0.50, flavor: 'Cherry')
Product.create(sku: '413778', description: 'Coffee-flavored toothpaste', price: 0.50, flavor: 'Coffee')
Product.create(sku: '599612', description: 'Orange coffee mug', price: 0.50, color: 'Orange')
Product.create(sku: '599613', description: 'Black coffee mug', price: 0.50, color: 'Black')
Product.create(sku: '599614', description: 'Gray coffee mug', price: 0.50, color: 'Gray')
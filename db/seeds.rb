# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.create(sku: '323167', description: 'Red-bristle toothbrush', price: 13.00, color: 'Red')
Product.create(sku: '323168', description: 'Blue-bristle toothbrush', price: 13.00, color: 'Blue')
Product.create(sku: '323169', description: 'Yellow-bristle toothbrush', price: 13.00, color: 'Yellow')
Product.create(sku: '413776', description: 'Mint-flavored toothpaste', price: 8.99, flavor: 'Mint')
Product.create(sku: '413777', description: 'Cherry-flavored toothpaste', price: 8.99, flavor: 'Cherry')
Product.create(sku: '413778', description: 'Coffee-flavored toothpaste', price: 8.99, flavor: 'Coffee')
Product.create(sku: '599612', description: 'Orange coffee mug', price: 22.95, color: 'Orange')
Product.create(sku: '599613', description: 'Black coffee mug', price: 22.95, color: 'Black')
Product.create(sku: '599614', description: 'Gray coffee mug', price: 22.95, color: 'Gray')
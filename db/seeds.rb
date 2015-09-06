# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.create(photo: 'red.png', sku: '323167', description: 'Red-bristle toothbrush', price: 0.50, color: 'Red')
Product.create(photo: 'blue.png', sku: '323168', description: 'Blue-bristle toothbrush', price: 0.50, color: 'Blue')
Product.create(photo: 'yellow.png', sku: '323169', description: 'Yellow-bristle toothbrush', price: 0.50, color: 'Yellow')
Product.create(photo: 'mint.jpg', sku: '413776', description: 'Mint-flavored toothpaste', price: 0.50, flavor: 'Mint')
Product.create(photo: 'cherry.jpg', sku: '413777', description: 'Cherry-flavored toothpaste', price: 0.50, flavor: 'Cherry')
Product.create(photo: 'coffee.jpg', sku: '413778', description: 'Coffee-flavored toothpaste', price: 0.50, flavor: 'Coffee')
Product.create(photo: 'orange.jpg', sku: '599612', description: 'Orange coffee mug', price: 0.50, color: 'Orange')
Product.create(photo: 'black.jpg', sku: '599613', description: 'Black coffee mug', price: 0.50, color: 'Black')
Product.create(photo: 'gray.jpg', sku: '599614', description: 'Gray coffee mug', price: 0.50, color: 'Gray')
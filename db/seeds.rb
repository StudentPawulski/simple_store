# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# puts Faker::Types.rb_string

# 676.times do
#  Product.create(title: Faker::Types.rb_string,
#                 description: Faker::Company.bs,
#                 price: Faker::Number.between(from: 0.01, to: 9999.99),
#                 stock_quantity: Faker::Number.between(from: 1, to: 99))
# end
# puts Product.count

Product.destroy_all
Category.destroy_all

csv_file = Rails.root + 'db/products.csv'

products = SmarterCSV.process(csv_file)

products.each do |product|
  category = Category.find_or_create_by(name: product[:category])
  Product.create(title: product[:name],
                 price: product[:price],
                 description: product[:description],
                 stock_quantity: product[:stock_quantity],
                 category_id: category[:id])
end

# Category.destroy_all

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'date'
def random_date_within_last_year
  start_date = Date.today - 1.year
  end_date = Date.today
  rand(start_date..end_date)
end

def random_time
  Time.at(rand * Time.now.to_i)
end
puts "Cleaning database..."
Account.destroy_all
# category.destroy_all

Transaction.destroy_all
User.destroy_all

puts "Cleaned the DB!"

puts "Creating 1 admin user..."

User.create!(email: "admin@finacet.com", password: "123456")

puts "Finished creating 1 admin user"

puts "---------------------------------"
puts "Creating accounts..."

account = Account.new(name: "Savings", balance: 1000, user: User.first)
account.save

account = Account.new(name: "Checking", balance: 500, user: User.first)
account.save
puts "Finished creating accounts"

puts "---------------------------------"

puts "Creating categories..."
category_names = ["Groceries", "Rent", "Utilities", "Transportation", "Entertainment", "Health", "Insurance"]
categories = {}

category_names.each do |name|
  categories[name] = Category.create(name: name)
end

puts "Finished creating categories"

puts "---------------------------------"



puts "Creating transactions..."


transaction_types = ["deposit", "withdrawal"]
20.times do
  transaction_types.each do |transaction_type|
    Transaction.create(
      amount: rand(100..500),
      name: transaction_type,
      account: Account.first,
      user: User.first,
      category: categories.values.sample,
      transaction_date: random_date_within_last_year,
      transaction_time: random_time
    )
  end
end

20.times do
  transaction_types.each do |transaction_type|
    Transaction.create(
      amount: rand(100..500),
      name: transaction_type,
      account: Account.second,
      user: User.first,
      category: categories.values.sample,
      transaction_date: random_date_within_last_year,
      transaction_time: random_time
    )
  end
end

puts "Finished creating transactions"

puts "---------------------------------"

puts "Finished seeding the database!"

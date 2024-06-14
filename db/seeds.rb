# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "Cleaning database..."
Account.destroy_all
# Catagory.destroy_all
Expense.destroy_all
Income.destroy_all
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

category = Catagory.new(name: "Groceries")
category.save

category = Catagory.new(name: "Rent")
category.save

category = Catagory.new(name: "Utilities")
category.save

category = Catagory.new(name: "Transportation")
category.save

category = Catagory.new(name: "Entertainment")
category.save

category = Catagory.new(name: "Health")
category.save

category = Catagory.new(name: "Insurance")
category.save

puts "Finished creating categories"

puts "---------------------------------"

puts "Creating expenses..."

expense = Expense.new(amount: 100, account: Account.first, user: User.first, catagory: Catagory.first)
expense.save

expense = Expense.new(amount: 200, account: Account.first, user: User.first, catagory: Catagory.second)
expense.save

expense = Expense.new(amount: 300, account: Account.first, user: User.first, catagory: Catagory.third)
expense.save

expense = Expense.new(amount: 400, account: Account.first, user: User.first, catagory: Catagory.fourth)
expense.save

expense = Expense.new(amount: 500, account: Account.first, user: User.first, catagory: Catagory.fifth)
expense.save

expense = Expense.new(amount: 600, account: Account.first, user: User.first, catagory: Catagory.last)
expense.save

puts "Finished creating expenses"

puts "---------------------------------"

puts "Creating incomes..."

income = Income.new(amount: 1000, account: Account.first, user: User.first, catagory: Catagory.first)
income.save

income = Income.new(amount: 2000, account: Account.first, user: User.first, catagory: Catagory.second)
income.save

puts "Finished creating incomes"

puts "---------------------------------"

puts "Creating transactions..."

transaction = Transaction.new(amount: 100, account: Account.first, user: User.first, catagory: Catagory.first)
transaction.save

transaction = Transaction.new(amount: 200, account: Account.first, user: User.first, catagory: Catagory.second)
transaction.save

transaction = Transaction.new(amount: 300, account: Account.first, user: User.first, catagory: Catagory.third)
transaction.save

transaction = Transaction.new(amount: 400, account: Account.first, user: User.first, catagory: Catagory.fourth)
transaction.save

transaction = Transaction.new(amount: 500, account: Account.first, user: User.first, catagory: Catagory.fifth)
transaction.save

transaction = Transaction.new(amount: 600, account: Account.first, user: User.first, catagory: Catagory.last)
transaction.save

puts "Finished creating transactions"

puts "---------------------------------"

puts "Finished seeding the database!"

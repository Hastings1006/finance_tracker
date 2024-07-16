require 'date'

def random_date_within_last_year
  start_date = Date.today - 1.year
  end_date = Date.today
  rand(start_date..end_date)
end


puts "Cleaning database..."
TransactionCategory.destroy_all
Transaction.destroy_all
Account.destroy_all
Category.destroy_all
User.destroy_all

puts "Cleaned the DB!"

puts "Creating 1 admin user..."

admin_user = User.create!(email: "admin@finacet.com", password: "123456")

puts "Finished creating 1 admin user"

puts "---------------------------------"
puts "Creating accounts..."

account = Account.new(name: "Savings", balance: 1000, user: User.first)
account.save

account = Account.new(name: "Checking", balance: 500, user: User.first)
account.save
puts "Finished creating accounts"

puts "---------------------------------"

# puts "Creating categories..."
# category_names = ["Groceries", "Rent", "Utilities", "Transportation", "Entertainment", "Health", "Insurance"]
# categories = {}

# category_names.each do |name|
#   categories[name] = Category.create(name: name)
# end

# puts "Finished creating categories"

puts "---------------------------------"

puts "Creating categories..."

category_names = ["Groceries", "Rent", "Utilities", "Transportation", "Entertainment", "Health", "Insurance"]
categories = {}

category_names.each do |name|
  categories[name] = Category.create!(name: name)
end

puts "Finished creating categories"

puts "---------------------------------"

puts "Creating transactions..."


accounts = Account.all

transaction_types = ["deposit", "withdrawal"]

20.times do
  accounts.each do |account|
    transaction_types.each do |transaction_type|
      # Create the transaction
      Transaction.create(
        amount: rand(100..500),
        transaction_type: transaction_type,
        account: account,
        transaction_date: random_date_within_last_year,
      )
    end
  end
end

puts "Finished creating transactions"

puts "---------------------------------"

puts "Creating transaction categories..."

Transaction.all.each do |transaction|
  random_category = Category.order('RANDOM()').first
  TransactionCategory.create(
    transaction_record: transaction,
    category: random_category
    )
end


puts "Finished seeding the database!"

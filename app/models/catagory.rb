class Catagory < ApplicationRecord
  has_many :expenses
  has_many :incomes
  has_many :transactions
  
end

class Budget < ApplicationRecord
  belongs_to :user
  has_many :transactions
  has_many :incomes, through: :user
end

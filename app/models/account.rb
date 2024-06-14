class Account < ApplicationRecord
  belongs_to :user
  has_many :transactions, dependent: :destroy
  has_many :incomes, dependent: :destroy
  has_many :expenses, dependent: :destroy
end

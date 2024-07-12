class Budget < ApplicationRecord
  belongs_to :user
  has_many :expenses, through: :user
  has_many :incomes, through: :user
end

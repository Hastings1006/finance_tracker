class Category < ApplicationRecord
  has_many :transaction_categories, dependent: :destroy
  has_many :transactions, through: :transaction_categories
  
  validates :name, presence: true, uniqueness: true
end

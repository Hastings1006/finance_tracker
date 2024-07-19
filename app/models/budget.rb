class Budget < ApplicationRecord
  # belongs_to :user
  belongs_to :user
  has_many :accounts, through: :user
  has_many :transactions, through: :accounts
  # validates :user_id, uniqueness: true
  # after_commit :create_budget, on: [:create, :update, :destroy]

  def average_income
    transactions.where(transaction_type: 'income').average(:amount) || 0
  end
end

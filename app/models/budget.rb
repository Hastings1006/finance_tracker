class Budget < ApplicationRecord
  # belongs_to :user
  belongs_to :user
  has_many :accounts
  has_many :transactions, through: :accounts
  # after_commit :create_budget, on: [:create, :update, :destroy]

  def update_budget_amount
    update_columns(ammount: transactions.sum(:amount))
  end
end

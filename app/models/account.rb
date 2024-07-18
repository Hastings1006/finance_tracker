class Account < ApplicationRecord
  belongs_to :user
  # belongs_to :budget, optional: true
  has_many :transactions, dependent: :destroy

  # # after_create :adjust_balance_by_transaction
  # def update_budget_amount
  #   update(ammount: transactions.sum(:amount))
  # end

  # def adjust_balance_by_transaction
  #   if transaction_type == 'deposit'
  #     account.update(balance:account.balance + amount)
  #     elseif transaction_type == 'withdrawal'
  #     account.update(balance: account.balance - amount)
  #   end
  # end
end

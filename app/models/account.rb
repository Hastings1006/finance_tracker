class Account < ApplicationRecord
  belongs_to :user
  has_one :budget
  has_many :transactions

  after_create :adjust_balance_by_transaction

  private

  def adjust_balance_by_transaction
    if transaction_type == 'deposit'
      account.update(balance:account.balance + amount)
      elseif transaction_type == 'withdrawal'
      account.update(balance: account.balance - amount)
    end
  end
end

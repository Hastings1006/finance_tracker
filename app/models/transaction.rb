class Transaction < ApplicationRecord
  belongs_to :account
  belongs_to :category

  validates :amount, :transaction_date, :transaction_type, :account_id, presence: true

  after_create :adjust_balance_by_transaction
  # after_commit :update_budget, on: [:create, :update, :destory]

  private

  def adjust_balance_by_transaction
    account.update(balance: account.balance + amount)
  end
end

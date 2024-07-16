class Account < ApplicationRecord
  belongs_to :user
  has_many :transactions, dependent: :destroy

  def adjust_balance_by_transaction(transaction)
    unless self
      raise "Account not found"
    end

    ActiveRecord::Base.transaction do
      self.lock!
      self.balance += transaction.amount
      self.save!
    end
  end
end

class Transaction < ApplicationRecord
  belongs_to :account
  has_many :transaction_categories, foreign_key: 'transaction_record_id'
  has_many :categories, through: :transaction_categories
  # belongs_to :user, through: :account
  validates :account, presence: true

  after_create :adjust_balance

  private

  def adjust_balance
    account.adjust_balance_by_transaction(self)
  end
end

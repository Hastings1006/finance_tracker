class Transaction < ApplicationRecord
  belongs_to :account

  validates :account_id, presence: true

  has_many :transaction_categories, foreign_key: 'transaction_record_id'
  has_many :categories, through: :transaction_categories
  # belongs_to :user, through: :account
  # validates :account, presence: true

  after_create :adjust_balance_by_transaction
  # after_commit :update_budget, on: [:create, :update, :destory]

  private

  def adjust_balance_by_transaction
    account.update(balance: account.balance + amount)
  end

  # def update_budget
  #   account.update_budget if account.present?
  #   end

  end

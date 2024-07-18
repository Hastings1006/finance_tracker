class Transaction < ApplicationRecord
  belongs_to :account
  has_many :transaction_categories, foreign_key: 'transaction_record_id'
  has_many :categories, through: :transaction_categories
  # belongs_to :user, through: :account
  validates :account, presence: true

  after_create :adjust_balance
  after_commit :update_budget, on: [:create, :update, :destory]

  private

  def update_budget
    account.update_budget if account.present?
    end

  def adjust_balance
    account.adjust_balance_by_transaction(self)
  end
end

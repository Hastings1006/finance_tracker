class Transaction < ApplicationRecord
  belongs_to :account
  has_many :transaction_categories, foreign_key: 'transaction_record_id'
  has_many :categories, through: :transaction_categories
  # has_one :user, through: :account
  validates :account, presence: true

end

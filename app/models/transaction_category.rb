class TransactionCategory < ApplicationRecord
  belongs_to :account
  # belongs_to :transaction_record, class_name: 'Transaction', foreign_key: 'transaction_record_id'
  belongs_to :category


end

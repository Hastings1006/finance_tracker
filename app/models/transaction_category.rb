class TransactionCategory < ApplicationRecord

  belongs_to :transaction_record, class_name: 'Transaction', foreign_key: 'transaction_record_id'
  belongs_to :category

    validates :transaction_record_id, :category_id, presence: true
end

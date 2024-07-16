class Transaction < ApplicationRecord
  belongs_to :account


  validates :account, presence: true
  validates :user, presence: true

end

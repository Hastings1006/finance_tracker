class Transaction < ApplicationRecord
  belongs_to :account
  belongs_to :user


  validates :account, presence: true
  validates :user, presence: true

end

class Transaction < ApplicationRecord
  belongs_to :account
  belongs_to :user
  belongs_to :catagory

end

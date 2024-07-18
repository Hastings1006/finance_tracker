class Budget < ApplicationRecord
  # belongs_to :user
  has_many :accounts
  has_many :transactions, through: :accounts
  belongs_to :user
  after_commit :create_budget, on: [:create, :update, :destroy]

  def create_budget
    if amount > 0
      budget.update(ammount)
    end
  end
end

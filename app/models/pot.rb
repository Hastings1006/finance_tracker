class Pot < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :goal, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :amount, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end

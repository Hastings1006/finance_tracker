class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :accounts, dependent: :destroy
          has_many :transactions, dependent: :destroy
          has_many :incomes, dependent: :destroy
          has_many :expenses, dependent: :destroy
          has_many :budgets, dependent: :destroy
end

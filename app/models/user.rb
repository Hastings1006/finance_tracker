class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        has_many :accounts, dependent: :destroy
        has_many :transactions, dependent: :destroy, through: :accounts

        has_many :budgets, dependent: :destroy, through: :accounts
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :accounts, dependent: :destroy
          has_many :transactions, dependent: :destroy, through: :accounts
          has_many :incomes, dependent: :destroy
          has_many :expenses, dependent: :destroy
          has_one :budget, dependent: :destroy
end

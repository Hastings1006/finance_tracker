class PagesController < ApplicationController
  def home
    @accounts = Account.where(user_id: current_user.id)
    @total = @accounts.sum(:balance)

    @expenses = Expense.includes(:category).where(user_id: current_user.id)
    @expenses_by_category = @expenses.group_by { |expense| expense.category_id.to_i }.transform_values do |expenses|
      expenses.sum { |expense| expense.amount }

    @budgets = Budget.where(user: current_user)
    end
  end


end

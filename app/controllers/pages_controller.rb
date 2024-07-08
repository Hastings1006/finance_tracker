class PagesController < ApplicationController
  def home
    @accounts = Account.where(user_id: current_user.id)
    @total = @accounts.sum(:balance)
    @expenses = Expense.where(user_id: current_user.id).pluck(:amount)
     @expenses_by_category = @expenses.group_by(&:category_id).transform_values { |expenses| expenses.sum(&:amount) }
  end


end

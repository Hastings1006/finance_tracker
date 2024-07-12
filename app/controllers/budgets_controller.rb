class BudgetsController < ApplicationController
 before_action :set_budget, only: [:show]

  def show
      @incomes = @budget.try(:user).try(:incomes)
      @avg_income = avg(@incomes)
      @expenses = @budget.try(:user).try(:expenses)
      @avg_expense = avg(@expenses)
      @net_income = @avg_income - @avg_expense if @avg_income && @avg_expense
      @goal = @avg_income * 0.2 if @avg_income
  end

  def new
    @budget = Budget.new
  end

  def create
    @budget = Budget.new(budget_params)
    @budget.user = current_user

    if @budget.save
      redirect_to root_path, notice: 'Budget was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_budget
    @budget = current_user.budget
  end

  def budget_params
    params.require(:budget).permit(:ammount, :name)
  end

  def avg(amount)
    amount.average(:amount)
  end
end

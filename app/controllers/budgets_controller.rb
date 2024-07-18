class BudgetsController < ApplicationController
  before_action :authenticate_user!
 before_action :set_budget, only: [:show]



  def show
    if @budget
      # Calculate incomes (deposits)
      incomes = @budget.accounts.joins(:transactions).where(transactions: { transaction_type: 'deposit' })
      @avg_income = calculate_average(incomes.pluck(:amount)) || 0

      # Calculate expenses (withdrawals)
      expenses = @budget.accounts.joins(:transactions).where(transactions: { transaction_type: 'withdrawal' })
      @avg_expense = calculate_average(expenses.pluck(:amount)) || 0

      # Calculate net income and goal
      @net_income = @avg_income - @avg_expense if @avg_income && @avg_expense
      @goal = @net_income * 0.2 if @net_income
    else
      redirect_to root_path, alert: "Budget not found for current user"
    end
  end

  def new

      @budget = Budget.new

  end

  def create
    @budget = Budget.new(budget_params)
    # @budget.user = current_user
    @budget.user_id = current_user.id

    if @budget.save
      # create_budget if @budget.ammount > 0
      redirect_to root_path, notice: 'Budget was successfully created.'

    else
      render :new, status: :unprocessable_entity
    end

  end

  private

  def update_budget
    @budget.update(ammount: @budget.ammount)
  end

  def set_budget
    @budget = Budget.find_by(user_id: current_user.id)
  end


  def budget_params
    params.require(:budget).permit(:ammount, :name, :user_id)
  end

  def calculate_average(array)
    return nil if array.empty?
    array.sum / array.size.to_f
  end

end

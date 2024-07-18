class BudgetsController < ApplicationController
  before_action :authenticate_user!
 before_action :set_budget, only: [:show]
  def index
    @budgets = Budget.where(user_id: current_user.id)
  end

  def show
    # @transactions = Transaction.joins(:account).where(accounts: { user_id: current_user.id })
        @transactions = Transaction.joins(account: :budget).where(accounts: { user_id: current_user.id })
      # Calculate incomes (deposits)
    incomes = @transactions.where(transaction_type: 'deposit')
    @avg_income = incomes.average(:amount) || 0

    # Calculate expenses (withdrawals)
    expenses = @transactions.where(transaction_type: 'withdrawal')
    @avg_expense = expenses.average(:amount) || 0

    # Calculate net income and goal (assuming avg_income is available)

      @net_income = @avg_income - @avg_expense
      @goal = @avg_income * 0.2

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

  def budget_save

  end

  private

  def set_budget
    @budget = current_user.budgets.find(params[:id])
    # @budget = current_user.budget.sum(:ammount)
  end

  def budget_params
    params.require(:budget).permit(:ammount, :name)
  end

  def avg(transactions)
    return 0 if transactions.empty?
    transactions.sum(:amount) / transactions.count
  end
end

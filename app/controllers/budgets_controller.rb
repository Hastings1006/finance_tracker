class BudgetsController < ApplicationController
 before_action :set_budget, only: [:show]

  def show
    @budget = Budget.find_by(user: current_user)
  end

  def new
    @budget = Budget.new
  end

  def create
    @budget = Budget.new(budget_params)
    @budget.user_id = current_user.id

    if @budget.save
      redirect_to root_path, notice: 'Budget was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end


  private

  def set_budget
    @budget = Budget.where(user_id: current_user.id)
  end

  def budget_params
    params.require(:budget).permit(:ammount, :name, :user_id)
  end
end

class AccountsController < ApplicationController
  before_action :set_account_by_user, only: [:index, :show]

  def index
    @total_balance = @accounts.sum(:balance)
  end

  def show
    @account = @accounts.find(params[:id])

  end

  def edit
    @account = @accounts.find(params[:id])

  end

  def update
    @account = @accounts.find(params[:id])
    if @account.update(account_params)
      redirect_to account_path(@account), notice: 'Account was successfully updated.'
    else
      render :edit
    end
  end



  private

  def set_account_by_user
    @accounts = Account.where(user_id: current_user.id)
    if @accounts.empty?
      redirect_to root_path, alert: 'Account not found.'
    end
  end

  def account_params
    params.require(:account).permit(:name, :email, :balance)
  end
end

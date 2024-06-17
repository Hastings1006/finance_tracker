class AccountsController < ApplicationController
  before_action :set_account_by_user, only: [:show]

  def show

  end

  def total_balance
    set_account_by_user
    @total_balance = @accounts.sum(:balance)
  end

  private

  def set_account_by_user
    @accounts = Account.where(user_id: params[:user_id])
    if @accounts.empty?
      redirect_to root_path, alert: 'Account not found.'
    end
  end

  def account_params
    params.require(:account).permit(:name, :email, :balance)
  end

  def set_default_balance
    self.balance ||= 0
  end
end

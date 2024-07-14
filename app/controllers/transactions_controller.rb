class TransactionsController < ApplicationController
  before_action :set_transactions, only: [:index]

  def index
  end

  def show
    if params[:account_id]
      @transaction = Account.find_by_id(params[:account_id]).transactions
    end
  end

  private

  def set_transactions
    @transactions = Transaction.where(user_id: current_user.id)
  end

end

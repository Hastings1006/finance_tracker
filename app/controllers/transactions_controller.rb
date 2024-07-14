class TransactionsController < ApplicationController
  before_action :set_transactions, only: [:index]

  def index
  end

  def show
    if params[:account_id]
      @transaction = Account.find_by_id(params[:account_id]).transactions
    end
  end

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(transaction_params)
  end

  private

  def set_transactions
    @transactions = Transaction.where(user_id: current_user.id)
  end

  def transaction_params
    params.require(:transaction).permit(:amount, :transaction_type, :transaction_date, :transaction_time)
  end
end
